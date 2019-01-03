package cz.jiripinkas.jba.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.jiripinkas.jba.entity.Complaint;
import cz.jiripinkas.jba.event.OnComplaintCompleteEvent;
import cz.jiripinkas.jba.service.ComplaintService;
import cz.jiripinkas.jba.service.SecurityQuestionService;
import cz.jiripinkas.jba.service.SmsService;
import cz.jiripinkas.jba.service.StatusService;
import cz.jiripinkas.jba.service.UserService;

@Controller
@EnableWebMvc
@RequestMapping("/complaint")
public class ComplaintController {

	private static final Logger logger = Logger
			.getLogger(ComplaintController.class);

	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	private MessageSource messages;

	@Autowired
	private ApplicationEventPublisher eventPublisher;

	@Autowired
	private UserService userService;

	@Autowired
	private ComplaintService complaintService;

	@Autowired
	private StatusService statusService;

	@Autowired
	private SmsService smsService;

	@Autowired
	private Environment env;

	@Autowired
	private SecurityQuestionService securityQuestionService;

	@ModelAttribute("complaint")
	private Complaint constructComplaint() {
		logger.info("constructing new complaint");
		return new Complaint();
	}

	@RequestMapping
	public String complaint() {
		logger.info("Get request to complaint page");
		return "complaint";
	}

	/*
	 * @InitBinder public void initBinder(WebDataBinder binder){
	 * logger.info("Inside initBinder"); binder.setDisallowedFields("sponser");
	 * }
	 */

	@RequestMapping(method = RequestMethod.POST)
	public String doRegister(@Valid @ModelAttribute("complaint") Complaint tmp,
			BindingResult result, RedirectAttributes redirectAttributes,
			final HttpServletRequest request) {

		if (result.hasErrors()) {
			logger.info("Inside BindingResult");
			return complaint();
		}
		
		tmp.setStatus(statusService.findByName("SAVED"));
		
		Complaint complaint = complaintService.save(tmp);

		if (complaint == null) {
			redirectAttributes.addFlashAttribute("success", false);
			return "redirect:/complaint.html";
		} else {
			logger.info("sending mail...");

			final String appUrl = "http://" + request.getServerName() + ":"
					+ request.getServerPort() + request.getContextPath();
			eventPublisher.publishEvent(new OnComplaintCompleteEvent(complaint,
					request.getLocale(), appUrl));

			redirectAttributes.addFlashAttribute("success", true);
			return "redirect:/complaint.html";
		}
	}
}
