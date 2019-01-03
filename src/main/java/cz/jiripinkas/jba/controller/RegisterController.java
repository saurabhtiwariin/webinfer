package cz.jiripinkas.jba.controller;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.jiripinkas.jba.entity.SecurityQuestion;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.entity.VerificationToken;
import cz.jiripinkas.jba.event.OnRegistrationCompleteEvent;
import cz.jiripinkas.jba.service.SecurityQuestionService;
import cz.jiripinkas.jba.service.SmsService;
import cz.jiripinkas.jba.service.UserService;

@Controller
@EnableWebMvc
@RequestMapping("/register")
public class RegisterController {

	private static final Logger logger = Logger
			.getLogger(RegisterController.class);

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MessageSource messages;

	@Autowired
	private ApplicationEventPublisher eventPublisher;

	@Autowired
	private UserService userService;

	@Autowired
	private SmsService smsService;

	@Autowired
	private Environment env;

	@Autowired
	private SecurityQuestionService securityQuestionService;

	@ModelAttribute("user")
	private User constructUser() {
		logger.info("constructing new user");
		return new User();
	}

	@RequestMapping
	public String userRegister() {
		logger.info("Get request to registration page");
		return "userRegister";
	}
	
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder){
	 * logger.info("Inside initBinder"); binder.setDisallowedFields("sponser");
	 * }
	 */

	@RequestMapping(method = RequestMethod.POST)
	public String doRegister(@Valid @ModelAttribute("user") User user,@ModelAttribute("for") String regFor,
			BindingResult result, RedirectAttributes redirectAttributes,
			final HttpServletRequest request) {
		logger.info("Before binding results"+regFor);
		if (result.hasErrors()) {
			logger.info("Inside BindingResult");
			return userRegister();
		}

		logger.info("Saving new user "+user.getName()+" in database.");
		
		userService.save(user,regFor);

		logger.info("sending mail the enabling link because if not mailed the registration could not be completed.");

		final String appUrl = "http://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath();
		eventPublisher.publishEvent(new OnRegistrationCompleteEvent(user,
				request.getLocale(), appUrl));

		
		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/register.html";
	}

	@RequestMapping(value = "/regitrationConfirm", method = RequestMethod.GET)
	public String confirmRegistration(final Locale locale, final Model model,
			@RequestParam("token") final String token) {

		final VerificationToken verificationToken = userService
				.getVerificationToken(token);

		if (verificationToken == null) {
			final String message = messages.getMessage(
					"auth.message.invalidToken", null, locale);
			model.addAttribute("message", message);
			return "redirect:/badUser.html";
		}

		final User user = verificationToken.getUser();
		final Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("IST"));
		if ((verificationToken.getExpiryDate().getTime() - cal.getTime()
				.getTime()) <= 0) {
			model.addAttribute("message",
					messages.getMessage("auth.message.expired", null, locale));
			model.addAttribute("expired", true);
			model.addAttribute("token", token);
			return "redirect:/badUser.html";
		}

		user.setEnabled(true);
		userService.saveRegisteredUser(user);
		model.addAttribute("message",
				messages.getMessage("message.accountVerified", null, locale));
		return "redirect:/index.html";
	}

	/* resend verification token */

	@RequestMapping(value = "/resendRegistrationToken", method = RequestMethod.GET)
	@ResponseBody
	public String resendRegistrationToken(final HttpServletRequest request,
			@RequestParam("token") final String existingToken) {
		final VerificationToken newToken = userService
				.generateNewVerificationToken(existingToken);
		final User user = userService.getUser(newToken.getToken());
		final String appUrl = "http://" + request.getServerName() + ":"
				+ request.getServerPort() + request.getContextPath();
		final SimpleMailMessage email = constructResendVerificationTokenEmail(
				appUrl, request.getLocale(), newToken, user);
		mailSender.send(email);

		return "redirect:/index.html";
		/*
		 * return new GenericResponse(messages.getMessage("message.resendToken",
		 * null, request.getLocale()));
		 */
	}

	private final SimpleMailMessage constructResendVerificationTokenEmail(
			final String contextPath, final Locale locale,
			final VerificationToken newToken, final User user) {
		final String confirmationUrl = contextPath
				+ "/regitrationConfirm.html?token=" + newToken.getToken();
		final String message = messages.getMessage("message.resendToken", null,
				locale);
		final SimpleMailMessage email = new SimpleMailMessage();
		email.setSubject("Resend Registration Token");
		email.setText(message + " \r\n" + confirmationUrl);
		email.setTo(user.getEmail());
		email.setFrom(env.getProperty("support.email"));
		return email;
	}

	/* Dynamic ajax jquery */

	@RequestMapping("/available")
	@ResponseBody
	public String available(@RequestParam String username) {
		Boolean available = userService.findOne(username) == null;
		return available.toString();
	}

	@RequestMapping("/sendOTP")
	@ResponseBody
	public void sendOTP(@RequestParam String mobNo) {
		String otp = smsService.getNewOTP();
		logger.error("sendOTP() - "+otp);
		smsService.sendOTPAndPersist(mobNo, otp);
	}

	@RequestMapping("/verifyOTP")
	@ResponseBody
	public String verifyOTP(@RequestParam String otp) {
		return smsService.verifyOTP(otp);
	}

	@RequestMapping("/uniquePanNo")
	@ResponseBody
	public String uniquePanNo(@RequestParam String panNo) {
		Boolean available = userService.findUserByPanNO(panNo) == null;
		return available.toString();
	}
	@RequestMapping("/uniqueEmail")
	@ResponseBody
	public String uniqueEmail(@RequestParam String email) {
		Boolean available = userService.findUserByEmail(email) == null;
		return available.toString();
	}

	@RequestMapping("/availableSponser")
	@ResponseBody
	public String availableSponser(@RequestParam Integer userId) {
		Boolean available = userService.findOne(userId) != null;
		return available.toString();
	}

	@RequestMapping("/availableSponserName")
	@ResponseBody
	public String availableSponserName(@RequestParam Integer sponserId) {
		int l = 0, r = 0;
		String res = null;

		if (sponserId == null) {
			return "You have an option to enter Sponser. He will get 1 day referral bonus on his available balance.";
		}

		User user = userService.findOne(sponserId);

		res = "<b>Mr/Ms "
				+ user.getName()
				+ " will be getting 1 day bonus balance as sponser's benefit. His both position is empty.</b>";
		return res;
	}

	@RequestMapping(value = "/allSecurityQuestion", method = RequestMethod.GET)
	@ResponseBody
	public String allSecurityQuestion() {
		String res = "";
		List<SecurityQuestion> questions = securityQuestionService.findAll();
		// res+="<form:select path=\"securityQuestion\">";
		res += "<select name=\"securityQuestion.id\" id=\"securityQuestion\">";

		for (Iterator iterator = questions.iterator(); iterator.hasNext();) {
			SecurityQuestion securityQuestion = (SecurityQuestion) iterator
					.next();
			res += "<option value=\"" + securityQuestion.getId() + "\">"
					+ securityQuestion.getSecurityQ() + "</option>";
		}

		res += "</select>";
		return res;
	}
}
