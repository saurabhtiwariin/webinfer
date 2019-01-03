package cz.jiripinkas.jba.controller;

import java.security.Principal;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.jiripinkas.jba.entity.BankDetails;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.service.BankDetailsService;
import cz.jiripinkas.jba.service.UserService;

/**
 * this controller is accessed by editProfile.jsp. To set Bank details info.
 * */

@Controller
@EnableWebMvc
@RequestMapping("/user")
public class BankDetailsController {

	private static final Logger logger = Logger
			.getLogger(BankDetailsController.class);

	@Autowired
	private BankDetailsService bankDetailsService;

	@Autowired
	private UserService userService;

	@ModelAttribute("bankDetails")
	private BankDetails bankDetailsForm() {
		logger.info("Inside bankDetailsForm()");
		return new BankDetails();
	}

	@RequestMapping("/editProfile")
	public String editProfileGet(Model model,Principal principal) {
		logger.info("Inside editProfileGet()");
		User user = userService.getUser(principal);
		model.addAttribute(user);

		if (user.getBankDetails() != null) {
			model.addAttribute("bankDetails",user.getBankDetails());
		}
		return "editProfile";
	}
	
	
	@RequestMapping(value = "/editProfile", method = RequestMethod.POST)
	public String editProfilePost(@ModelAttribute("bankDetails") BankDetails bankDetails,
			BindingResult result, RedirectAttributes redirectAttributes,Principal principal) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			return "/editProfile";
		}
		bankDetailsService.save(bankDetails,principal);

		redirectAttributes.addFlashAttribute("success", true);
		return "redirect:/user/editProfile.html";
	}

}
