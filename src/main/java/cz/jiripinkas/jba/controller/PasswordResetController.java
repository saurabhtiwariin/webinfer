package cz.jiripinkas.jba.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.Locale;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.jiripinkas.jba.entity.PasswordResetToken;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.exception.UserNotFoundException;
import cz.jiripinkas.jba.service.SecurityQuestionService;
import cz.jiripinkas.jba.service.UserService;

@Controller
@EnableWebMvc
public class PasswordResetController {
	
/*resetting password when logged in*/

	private static final Logger logger = Logger
			.getLogger(PasswordResetController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private SecurityQuestionService securityQuestionService;
	
    @Autowired
    private UserDetailsService userDetailsService;

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private Environment env;

	@Autowired
	private MessageSource messages;
	
	/*getting the security question for present user*/
	
	@RequestMapping(value="/user/getSecurityQuestion", method=RequestMethod.GET)
	@ResponseBody
	public String getSecurityQuestion(Principal principal) {
		return userService.getUser(principal).getSecurityQuestion().getSecurityQ();
	}
	

	/* password reset code starts */

	@RequestMapping("/user/editPassword")
	public String editPassword() {
		return "editPassword";
	}

	@RequestMapping(value = "/user/editPassword", method = RequestMethod.POST)
	public String newPassword(@RequestParam("password") String pass,
			Principal principal, RedirectAttributes redirectAttributes) {
		if (userService.resetPassword(pass, principal)) {
			redirectAttributes.addFlashAttribute("success", true);
		}
		return "redirect:/user/editPassword.html";
	}

	BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

	@RequestMapping("/user/checkPassword")
	@ResponseBody
	public String checkPassword(@RequestParam("pass") String pass,
			Principal principal) {
		logger.info("Form pass = " + pass);

		User user = userService.getUser(principal);
		String encPass = user.getPassword();

		logger.info("dbPass pass = " + encPass);

		String encPassForm = encoder.encode(pass);

		logger.info("Form encoded pass = " + encPassForm);

		Boolean check = encPassForm.equals(encPass);

		return check.toString();
	}

	/* password reset code ends */
	/*resetting password when logged in ENDS*/

	
	/*resetting password when NOT logged in*/

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST)
	@ResponseBody
	public String resetPassword(
	  HttpServletRequest request, @RequestParam("email") String userEmail) {
	     logger.info("In resetPassword , email ="+userEmail);
	    User user = userService.findUserByEmail(userEmail);
	    if (user == null) {
	        throw new UserNotFoundException();
	    }
	 
	    String token = UUID.randomUUID().toString();
	    userService.createPasswordResetTokenForUser(user, token);
	    String appUrl = 
	      "http://" + request.getServerName() + 
	      ":" + request.getServerPort() + 
	      request.getContextPath();
	    SimpleMailMessage email = 
	      constructResetTokenEmail(appUrl, request.getLocale(), token, user);
	    mailSender.send(email);
	    logger.info("Out resetPassword");
	    return "true";
	}
	
	private final SimpleMailMessage constructResetTokenEmail(
			final String contextPath, final Locale locale, final String token,
			final User user) {
		logger.info("In constructResetTokenEmail");
		final String url = contextPath + "/changePassword.html?id="
				+ user.getId() + "&token=" + token;
		final String message = messages.getMessage("message.resetPassword",
				null, locale);
		final SimpleMailMessage email = new SimpleMailMessage();
		email.setTo(user.getEmail());
		email.setSubject("Reset Password");
		email.setText(message + " \r\n" + url);
		email.setFrom(env.getProperty("support.email"));
		logger.info("out constructResetTokenEmail");
		return email;
	}
	
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.GET)
	public String showChangePasswordPage(
	  Locale locale, Model model, @RequestParam("id") long id, @RequestParam("token") String token,RedirectAttributes redirectAttributes) {
	     
	    PasswordResetToken passToken = userService.getPasswordResetToken(token);
	    User user = passToken.getUser();
	    if (passToken == null || user.getId() != id) {
	    	String message = messages.getMessage("auth.message.invalidToken", null, locale);
	        model.addAttribute("message", message);
	        return "redirect:/index.html?lang=" + locale.getLanguage();
	    }
	 
	    Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
	    if ((passToken.getExpiryDate().getTime() - cal.getTime().getTime()) <= 0) {
	    	model.addAttribute("message", messages.getMessage("auth.message.expired", null, locale));
	        return "redirect:/index.html?lang=" + locale.getLanguage();
	    }

	    logger.info(1);
	    
	    Authentication auth = new UsernamePasswordAuthenticationToken(
	      user, null, null);
	    SecurityContextHolder.getContext().setAuthentication(auth);

//	    redirectAttributes.addAttribute("id",id);
	    logger.info("2 - id = "+ id);
	    return "redirect:/updatePassword.html?lang=" + locale.getLanguage();
	}
	
	@RequestMapping(value = "/savePassword", method = RequestMethod.POST)
	@ResponseBody
	public String savePassword(Locale locale, @RequestParam("password") String password) {
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    logger.info("User = "+user.getId()+" Password = "+password);
	    userService.changeUserPassword(user, password);	
	    return "redirect:/logout";
	}
	/*resetting password when NOT logged in ENDS*/
}
