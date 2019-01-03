package cz.jiripinkas.jba.controller;

import java.security.Principal;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.jiripinkas.jba.entity.Commit;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.service.CommitService;
import cz.jiripinkas.jba.service.UserService;

@Controller
@EnableWebMvc
@RequestMapping("/user")
public class CommitmentController {

	private static final Logger logger = Logger
			.getLogger(RegisterController.class);

	@Autowired
	private CommitService commitService;
	
	@Autowired
	private UserService userService;
	
	
	@ModelAttribute("commit")
	private Commit constructCommit() {
		return new Commit();
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		logger.info("Inside initBinder");
		/* binder.setDisallowedFields("sponser"); */
	}

	@RequestMapping("/commitment")
	public String makeCommitment() {
		return "commitment";
	}

	@RequestMapping(value = "/commitment", method = RequestMethod.POST)
	public String doRegister(@Valid @ModelAttribute("commit") Commit commit,Principal principal,
			BindingResult result, RedirectAttributes redirectAttributes) {
		if (result.hasErrors()) {
			logger.info("Inside BindingResult");
			return "/commitment";
		}
		
		User user = userService.findOne(principal);
		
		long amt = commit.getAmount();
		if(amt==0 || amt % 500 != 0 || amt > 200000 ){
			redirectAttributes.addFlashAttribute("invalidCommitAmount", true);	
			return "redirect:/user/memberZone.html";	
		}
		
		if (commitService.allCommitsShouldNotBeAcceptedExceptFirstCommit(user)) {
			redirectAttributes.addFlashAttribute("commitNotAcepptedYet", true);
			return "redirect:/user/memberZone.html";
		}
		
		if (commitService.save(commit,principal.getName())) {
			redirectAttributes.addFlashAttribute("success", true);
			return "redirect:/user/memberZone.html";			
		}
		
		
		redirectAttributes.addFlashAttribute("success", false);
		return "redirect:/user/memberZone.html";


	}

	
/*	commitment report*/
	
	@RequestMapping("/commitmentReport")
	public String getCommitmentReport(Model model,Principal principal) {
		User user = userService.getUser(principal);	
		model.addAttribute("user",commitService.getAllCommitments(user));
		return "commitmentReport";
	}
	
	
}
