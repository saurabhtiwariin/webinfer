package cz.jiripinkas.jba.controller;

import java.security.Principal;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import cz.jiripinkas.jba.entity.Transaction;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.service.TransactionService;
import cz.jiripinkas.jba.service.UserService;

@Controller
@EnableWebMvc
@RequestMapping("/user")
public class TransactionController {

	private static final Logger logger = Logger
			.getLogger(TransactionController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private TransactionService transactionService;

	@RequestMapping("/myBalance")
	public String getMyBalance(Model model,Principal principal) {
		User user = userService.getUser(principal);
	//	user = userService.findOne(user.getId());
		model.addAttribute("user", user);
		return "myBalance";
	}
	
	
	@RequestMapping("/dailyIncome")
	public String getDailyIncome(Model model,Principal principal) {
		User user = userService.findOne(principal);
		List<Transaction> transactions =transactionService.findByUser(user,"dailyIncome");
		model.addAttribute("transactions", transactions);
		return "dailyIncome";
	}
}
