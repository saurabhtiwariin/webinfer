package cz.jiripinkas.jba.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.jiripinkas.jba.entity.Accept;
import cz.jiripinkas.jba.entity.BankDetails;
import cz.jiripinkas.jba.entity.Commit;
import cz.jiripinkas.jba.entity.Complaint;
import cz.jiripinkas.jba.entity.FileUpload;
import cz.jiripinkas.jba.entity.OTP;
import cz.jiripinkas.jba.entity.PasswordResetToken;
import cz.jiripinkas.jba.entity.Role;
import cz.jiripinkas.jba.entity.SecurityQuestion;
import cz.jiripinkas.jba.entity.Status;
import cz.jiripinkas.jba.entity.Transaction;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.entity.VerificationToken;
import cz.jiripinkas.jba.service.AcceptService;
import cz.jiripinkas.jba.service.BankDetailsService;
import cz.jiripinkas.jba.service.CommitService;
import cz.jiripinkas.jba.service.ComplaintService;
import cz.jiripinkas.jba.service.FileUploadService;
import cz.jiripinkas.jba.service.OTPService;
import cz.jiripinkas.jba.service.PasswordResetTokenService;
import cz.jiripinkas.jba.service.RoleService;
import cz.jiripinkas.jba.service.SecurityQuestionService;
import cz.jiripinkas.jba.service.StatusService;
import cz.jiripinkas.jba.service.TransactionService;
import cz.jiripinkas.jba.service.UserService;
import cz.jiripinkas.jba.service.VerificationTokenService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	private static final Logger logger = Logger
			.getLogger(AdminController.class);

	@Autowired
	private AcceptService acceptService;

	@Autowired
	private CommitService commitService;

	@Autowired
	private BankDetailsService bankDetailsService;

	@Autowired
	private ComplaintService complaintService;

	@Autowired
	private StatusService statusService;

	@Autowired
	private FileUploadService fileUploadService;

	@Autowired
	private RoleService roleService;

	@Autowired
	private SecurityQuestionService securityQuestionService;

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private UserService userService;

	@Autowired
	private OTPService otpService;

	@Autowired
	private PasswordResetTokenService passwordResetTokenService;

	@Autowired
	private VerificationTokenService verificationTokenService;

	@RequestMapping("/cronForward")
	public String cronForward() {
		userService.updateUserBalanceCronJob();
		return "redirect:/admin/user.html?page=0";
	}

	@RequestMapping("/dashboard")
	public String dashboard() {
		return "adminDashboard";
	}

	/* User table */

	@ModelAttribute("user")
	private User userModel() {
		logger.info("Inside userModel()");
		return new User();
	}

	@RequestMapping("/user")
	public String userGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside userGet");
		List<User> users = userService.getTableData(page);
		int allitems = userService.findAll().size();
		for (User user : users) {
			user.setRoles(userService.findRoles(user));
		}
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = (allitems / 10) + 1;
		}
		model.addAttribute("users", users);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);
		return "adminUser";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String userPost(Model model, @ModelAttribute("user") User user,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return userGet(model, page);
		}
		logger.info("inside post no binding result");

		userService.updateUserTable(user);

		redirectAttributes.addFlashAttribute("userTableUpdated", true);
		return "redirect:/admin/user.html?page=" + page;
	}

	/* User table ENDS */

	/* VerificationToken table */

	@ModelAttribute("verificationToken")
	private VerificationToken verificationTokenModel() {
		logger.info("Inside verificationTokenModel()");
		return new VerificationToken();
	}

	@RequestMapping("/verificationToken")
	public String verificationTokenGet(Model model,
			@RequestParam("page") int page) {
		logger.info("Inside verificationToken Get");
		List<VerificationToken> verificationTokens = verificationTokenService
				.getTableData(page);
		int allitems = verificationTokenService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("verificationTokens", verificationTokens);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);

		return "adminVerificationToken";
	}

	@RequestMapping(value = "/verificationToken", method = RequestMethod.POST)
	public String updateVerificationTokenTableAdmin(
			Model model,
			@ModelAttribute("verificationToken") VerificationToken verificationToken,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return verificationTokenGet(model, page);
		}
		logger.info("inside post no binding result");

		verificationTokenService
				.updateVerificationTokenTable(verificationToken);

		redirectAttributes.addFlashAttribute("verificationTokenTableUpdated",
				true);
		return "redirect:/admin/verificationToken.html?page=" + page;
	}

	/* transaction table ENDS */

	/* passwordResetToken table */

	@ModelAttribute("passwordResetToken")
	private PasswordResetToken passwordResetTokenModel() {
		logger.info("Inside passwordResetTokenModel()");
		return new PasswordResetToken();
	}

	@RequestMapping("/passwordResetToken")
	public String passwordResetTokenGet(Model model,
			@RequestParam("page") int page) {
		logger.info("Inside passwordResetToken Get");
		List<PasswordResetToken> passwordResetTokens = passwordResetTokenService
				.getTableData(page);
		int allitems = passwordResetTokenService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("passwordResetTokens", passwordResetTokens);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);

		return "adminPasswordResetToken";
	}

	@RequestMapping(value = "/passwordResetToken", method = RequestMethod.POST)
	public String updatePasswordResetTokenTableAdmin(
			Model model,
			@ModelAttribute("passwordResetToken") PasswordResetToken passwordResetToken,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return passwordResetTokenGet(model, page);
		}
		logger.info("inside post no binding result");

		passwordResetTokenService
				.updatePasswordResetTokenTable(passwordResetToken);

		redirectAttributes.addFlashAttribute("passwordResetTokenTableUpdated",
				true);
		return "redirect:/admin/passwordResetToken.html" + page;
	}

	/* passwordResetToken table ENDS */

	/* otp table */

	@ModelAttribute("otp")
	private OTP otpModel() {
		logger.info("Inside otpModel()");
		return new OTP();
	}

	@RequestMapping("/otp")
	public String otpGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside otp Get");
		List<OTP> otps = otpService.findAllPagination(page);
		int allitems = otpService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("otps", otps);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);
		return "adminOTP";
	}

	@RequestMapping(value = "/otp", method = RequestMethod.POST)
	public String updateOTPTableAdmin(Model model,
			@ModelAttribute("otp") OTP otp, @RequestParam("page") int page,
			BindingResult result, RedirectAttributes redirectAttributes) {

		if (result.hasErrors()) {
			logger.info("inside binding result");
			return otpGet(model, page);
		}

		otpService.updateOTPTable(otp);

		redirectAttributes.addFlashAttribute("otpTableUpdated", true);
		return "redirect:/admin/otp.html?page=" + page;
	}

	/* otp table ENDS */

	/* transaction table */

	@ModelAttribute("transaction")
	private Transaction transactionModel() {
		logger.info("Inside transactionModel()");
		return new Transaction();
	}

	@RequestMapping("/transaction")
	public String transactionGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside status Get");
		List<Transaction> transactions = transactionService.getTableData(page);
		int allitems = transactionService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("transactions", transactions);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);

		return "adminTransaction";
	}

	@RequestMapping(value = "/transaction", method = RequestMethod.POST)
	public String updateTransactionTableAdmin(Model model,
			@ModelAttribute("transaction") Transaction transaction,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return transactionGet(model, page);
		}
		logger.info("inside post no binding result");

		transactionService.updateTransactionTable(transaction);

		redirectAttributes.addFlashAttribute("transactionTableUpdated", true);
		return "redirect:/admin/transaction.html?page=" + page;
	}

	/* transaction table ENDS */

	/* Status table */

	@ModelAttribute("status")
	private Status statusModel() {
		logger.info("Inside statusModel()");
		return new Status();
	}

	@RequestMapping("/status")
	public String statusGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside status Get");
		List<Status> statuses = statusService.getTableData(page);
		int allitems = statusService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("statuses", statuses);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);

		return "adminStatus";
	}

	@RequestMapping(value = "/status", method = RequestMethod.POST)
	public String statusPost(Model model,
			@ModelAttribute("status") Status status,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return statusGet(model, page);
		}
		logger.info("inside post no binding result");

		statusService.updateStatusTable(status);

		redirectAttributes.addFlashAttribute("statusTableUpdated", true);
		return "redirect:/admin/status.html?page=" + page;
	}

	/* Status table ENDS */

	/* securityQuestion table */

	@ModelAttribute("securityQuestion")
	private SecurityQuestion securityQuestionModel() {
		logger.info("Inside securityQuestionModel()");
		return new SecurityQuestion();
	}

	@RequestMapping("/securityQuestion")
	public String securityQuestionGet(Model model,
			@RequestParam("page") int page) {
		logger.info("Inside securityQuestion Get");
		List<SecurityQuestion> securityQuestions = securityQuestionService
				.getTableData(page);
		int allitems = securityQuestionService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("securityQuestions", securityQuestions);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);

		return "adminSecurityQuestion";
	}

	@RequestMapping(value = "/securityQuestion", method = RequestMethod.POST)
	public String securityQuestionPost(
			Model model,
			@ModelAttribute("securityQuestion") SecurityQuestion securityQuestion,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return securityQuestionGet(model, page);
		}
		logger.info("inside post no binding result");

		securityQuestionService.updateSecurityQuestionTable(securityQuestion);

		redirectAttributes.addFlashAttribute("securityQuestionTableUpdated",
				true);
		return "redirect:/admin/securityQuestion.html?page=" + page;
	}

	/* Security Question ENDS */

	/* Role table */

	@ModelAttribute("role")
	private Role roleModel() {
		logger.info("Inside roleModel()");
		return new Role();
	}

	@RequestMapping("/role")
	public String roleGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside role Get");
		List<Role> roles = roleService.getTableData(page);
		int allitems = roleService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("roles", roles);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);
		return "adminRole";
	}

	@RequestMapping(value = "/role", method = RequestMethod.POST)
	public String rolePost(Model model, @ModelAttribute("role") Role role,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return roleGet(model, page);
		}
		logger.info("inside post no binding result");

		roleService.updateRoleTable(role);

		redirectAttributes.addFlashAttribute("roleTableUpdated", true);
		return "redirect:/admin/role.html?page=" + page;
	}

	/* Role table ENDS */

	/* File Upload table */

	@ModelAttribute("fileUpload")
	private FileUpload fileUploadModel() {
		logger.info("Inside fileUploadModel()");
		return new FileUpload();
	}

	@RequestMapping("/fileUpload")
	public String fileUploadGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside fileUpload Get");
		List<FileUpload> fileUploads = fileUploadService.getTableData(page);
		int allitems = fileUploadService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("fileUploads", fileUploads);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);
		return "adminFileUpload";
	}

	@RequestMapping(value = "/fileUpload", method = RequestMethod.POST)
	public String complaintPost(Model model,
			@ModelAttribute("fileUpload") FileUpload fileUpload,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return fileUploadGet(model, page);
		}
		logger.info("inside post no binding result");

		fileUploadService.updateFileUploadTable(fileUpload);

		redirectAttributes.addFlashAttribute("fileUploadTableUpdated", true);
		return "redirect:/admin/fileUpload.html?page=" + page;
	}

	/* File Upload table ENDS */

	/* Complaint table */

	@ModelAttribute("complaint")
	private Complaint complaintModel() {
		logger.info("Inside complaintModel()");
		return new Complaint();
	}

	@RequestMapping("/complaint")
	public String complaintGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside complaint get");
		List<Complaint> complaints = complaintService.getTableData(page);
		int allitems = complaintService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("complaints", complaints);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);
		return "adminComplaint";
	}

	@RequestMapping(value = "/complaint", method = RequestMethod.POST)
	public String complaintPost(Model model,
			@ModelAttribute("complaint") Complaint complaint,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return complaintGet(model, page);
		}
		logger.info("inside post no binding result");

		complaintService.updateComplaintTable(complaint);

		redirectAttributes.addFlashAttribute("complaintTableUpdated", true);
		return "redirect:/admin/complaint.html?page=" + page;
	}

	/* Complaint table ENDS */

	/* BankDetails table */

	@ModelAttribute("bankDetails")
	private BankDetails bankDetailsModel() {
		logger.info("Inside bankDetailsModel()");
		return new BankDetails();
	}

	@RequestMapping("/bankDetails")
	public String bankDetailsGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside bankDetails get");
		List<BankDetails> bankDetailsList = bankDetailsService
				.getTableData(page);
		int allitems = bankDetailsService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}

		model.addAttribute("bankDetailsList", bankDetailsList);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);
		return "adminBankDetails";
	}

	@RequestMapping(value = "/bankDetails", method = RequestMethod.POST)
	public String bankDetailsPost(Model model,
			@ModelAttribute("bankDetails") BankDetails bankDetails,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return bankDetailsGet(model, page);
		}
		logger.info("inside post no binding result");

		bankDetailsService.updateBankDetailsTable(bankDetails);

		redirectAttributes.addFlashAttribute("bankDetailsTableUpdated", true);
		return "redirect:/admin/bankDetails.html?page=" + page;
	}

	/* BankDetails table ENDS */

	/* Commit table */

	@ModelAttribute("commit")
	private Commit commitModel() {
		logger.info("Inside commitModel()");
		return new Commit();
	}

	@RequestMapping("/commit")
	public String commitGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside commit get");
		List<Commit> commits = commitService.getTableData(page);
		int allitems = commitService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("commits", commits);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);
		return "adminCommit";
	}

	@RequestMapping(value = "/commit", method = RequestMethod.POST)
	public String commitPost(Model model,
			@ModelAttribute("commit") Commit commit,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return commitGet(model, page);
		}
		logger.info("inside post no binding result");

		commitService.updateCommitTable(commit);

		redirectAttributes.addFlashAttribute("commitTableUpdated", true);
		return "redirect:/admin/commit.html?page=" + page;
	}

	/* Commit table ENDS */

	/* Accept table */

	@ModelAttribute("accept")
	private Accept acceptModel() {
		logger.info("Inside acceptModel()");
		return new Accept();
	}

	@RequestMapping("/accept")
	public String acceptGet(Model model, @RequestParam("page") int page) {
		logger.info("Inside accept get");
		List<Accept> accepts = acceptService.getTableData(page);
		int allitems = acceptService.findAll().size();
		int allPages = 0;
		if (allitems % 10 == 0) {
			allPages = allitems / 10;
		} else {
			allPages = allitems / 10 + 1;
		}
		model.addAttribute("accepts", accepts);
		model.addAttribute("page", page);
		model.addAttribute("allPages", allPages);

		return "adminAccept";
	}

	@RequestMapping(value = "/accept", method = RequestMethod.POST)
	public String acceptPost(Model model,
			@ModelAttribute("accept") Accept accept,
			@RequestParam("page") int page, BindingResult result,
			RedirectAttributes redirectAttributes) {
		logger.info("inside post *******************");
		if (result.hasErrors()) {
			logger.info("inside binding result");
			return acceptGet(model, page);
		}
		logger.info("inside post no binding result");
		// acceptService.updateAcceptTable(accept, idPath);
		acceptService.updateAcceptTable(accept);

		redirectAttributes.addFlashAttribute("acceptTableUpdated", true);
		return "redirect:/admin/accept.html?page=" + page;
	}

	/* Accept table ENDS */

	@RequestMapping("/addAdminRole/{id}")
	public String addAdminRole(@PathVariable int id) {
		Role roleAdmin = roleService.findByName("ROLE_ADMIN");
		
		User user = userService.findOne(id);
		List<Role> roles = userService.findRoles(user);
		if (! roles.contains(roleAdmin)) {
			roles.add(roleAdmin);
		}
		user.setRoles(roles);
		userService.save(user);
		return "redirect:/admin/user.html?page=0";
	}
	
	@RequestMapping("/removeAdminRole/{id}")
	public String removeAdminRole(@PathVariable int id) {
		Role roleUser = roleService.findByName("ROLE_USER");
		
		User user = userService.findOne(id);
		List<Role> roles = new ArrayList<Role>();
		roles.add(roleUser);
		
		user.setRoles(roles);
		userService.save(user);
		return "redirect:/admin/user.html?page=0";
	}
	
	@RequestMapping("/addNewAccept/{id}")
	public String addNewAccept(@PathVariable int id) {
		acceptService.addNewAccept(id);
		return "redirect:/admin/accept.html?page=0";
	}
	
	@RequestMapping("/deleteAccept/{id}")
	public String deleteAccept(@PathVariable int id) {
		acceptService.delete(id);
		return "redirect:/admin/accept.html?page=0";
	}
	
	@RequestMapping("/addNewCommit")
	public String addNewCommit(@RequestParam("commitId") Integer commitId) {
		commitService.addNewCommit(commitId);
		return "redirect:/admin/commit.html?page=0";
	}
	
	@RequestMapping("/deleteCommit")
	public String deleteCommit(@RequestParam("commitId") Integer commitId) {
		commitService.deleteCommit(commitId);
		return "redirect:/admin/commit.html?page=0";
	}
}