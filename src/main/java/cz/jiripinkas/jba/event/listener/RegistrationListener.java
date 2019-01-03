package cz.jiripinkas.jba.event.listener;

import java.util.UUID;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.event.OnRegistrationCompleteEvent;
import cz.jiripinkas.jba.service.UserService;

@Component
@PropertySource("classpath:email.properties")
public class RegistrationListener implements ApplicationListener<OnRegistrationCompleteEvent> {

	private static final Logger logger = Logger.getLogger(RegistrationListener.class);
	
	
    @Autowired
    private MessageSource messages;

    @Autowired
    private UserService userService;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private Environment env;

    // API

    @Override 
    public void onApplicationEvent(final OnRegistrationCompleteEvent event) {
        this.confirmRegistration(event);
    }

    private void confirmRegistration(final OnRegistrationCompleteEvent event) {
    	logger.info("Inside confirmRegistration");
    	final User user = event.getUser();
        final String token = UUID.randomUUID().toString();
        userService.createVerificationTokenForUser(user, token);

        final SimpleMailMessage email = constructEmailMessage(event, user, token);
        
        logger.info("mail has been send");
        
        mailSender.send(email);
    
    }

    //

    private final SimpleMailMessage constructEmailMessage(final OnRegistrationCompleteEvent event, final User user, final String token) {
    	logger.info("Inside constructEmailMessage");
    	final String recipientAddress = user.getEmail();
        final String subject = "Registration Confirmation \n";
        final String confirmationUrl = event.getAppUrl() + "/register/regitrationConfirm.html?token=" + token;
        logger.info("event.getLocale() : "+event.getLocale());
        final String message = messages.getMessage("message.regSucc", null, event.getLocale());
        logger.info("message : "+ message);
        
        final SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message + " \r\n" + confirmationUrl);
        email.setFrom(env.getProperty("support.email"));
 
        logger.info(env.getProperty("support.email"));
        
        return email;
    }

}
