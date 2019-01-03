package cz.jiripinkas.jba.event.listener;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

import cz.jiripinkas.jba.entity.Complaint;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.event.OnComplaintCompleteEvent;
import cz.jiripinkas.jba.service.UserService;

@Component
@PropertySource("classpath:email.properties")
public class ComplaintListener implements ApplicationListener<OnComplaintCompleteEvent> {

	private static final Logger logger = Logger.getLogger(ComplaintListener.class);
	
	
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
    public void onApplicationEvent(final OnComplaintCompleteEvent event) {
        this.sendConfirmMailToUser(event);
        this.sendMailToMMMINR(event);       
    }

    private void sendMailToMMMINR(OnComplaintCompleteEvent event) {
		// TODO Auto-generated method stub
    	logger.info("Inside sendMailToMMMINR");
    	final Complaint complaint = event.getComplaint();

        final SimpleMailMessage email = constructEmailMessageToMMMINR(event, complaint);
       
        mailSender.send(email);
        
        logger.info("mail has been send to user");
        		
	}

	private final SimpleMailMessage constructEmailMessageToMMMINR(
			OnComplaintCompleteEvent event, Complaint complaint) {
    	logger.info("Inside constructEmailMessageToMMMINR");
    	User user = userService.findOne(complaint.getUser().getId());
    	final String subject = "Complaint from userId("+user.getId()+") | Sub : "+complaint.getSubject();
    	final String userName = user.getName();
    	final String message = "UserName : "+userName+"\nMail Id Given : "+complaint.getEmail()+"\n\nMessage : \n\n"+complaint.getMessage();
    	
        final SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(env.getProperty("admin.email"));
        email.setSubject(subject);
        email.setText(message);
        email.setFrom(env.getProperty("support.email"));
 
        logger.info("mail send to MMMINR");
        
        return email;
}

	private void sendConfirmMailToUser(final OnComplaintCompleteEvent event) {
    	logger.info("Inside confirmRegistration");
    	final Complaint complaint = event.getComplaint();

        final SimpleMailMessage email = constructEmailMessage(event, complaint);
        
        
        mailSender.send(email);
        
        logger.info("mail has been send to user");
        
    }

    //

    private final SimpleMailMessage constructEmailMessage(final OnComplaintCompleteEvent event, final Complaint complaint) {
    	logger.info("Inside constructEmailMessage");
    	
    	final String recipientAddress = complaint.getEmail();
    	final String subject = complaint.getSubject();
    	final String userName = userService.findOne(complaint.getUser().getId()).getName();
    	final String message = "Hi "+userName+",\nThanks for contacting us, we will get back to you soon.\n\nThanks\nMMMINR SUPPORT.";
        
        
        final SimpleMailMessage email = new SimpleMailMessage();
        email.setTo(recipientAddress);
        email.setSubject(subject);
        email.setText(message);
        email.setFrom(env.getProperty("support.email"));

        return email;
    }

}
