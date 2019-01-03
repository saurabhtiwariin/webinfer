package cz.jiripinkas.jba.controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cz.jiripinkas.jba.entity.FileUpload;
import cz.jiripinkas.jba.entity.User;
import cz.jiripinkas.jba.service.AcceptService;
import cz.jiripinkas.jba.service.CommitService;
import cz.jiripinkas.jba.service.FileUploadService;
import cz.jiripinkas.jba.service.UserService;

@Controller
@EnableWebMvc
@RequestMapping("/user")
public class MemberZoneController {

	private static final Logger logger = Logger
			.getLogger(MemberZoneController.class);

	@Autowired
	private UserService userService;

	@Autowired
	private CommitService commitService;

	@Autowired
	private AcceptService acceptService;

	@Autowired
	private FileUploadService fileUploadService;

	/**
	 * Session related Interfaces and classes SessionRegistry SessionInformation
	 * Principal
	 */
	@RequestMapping(value = "/memberZone")
	public String getMemberZone(Model model, Principal principal,
			HttpSession session) {
		/*
		 * SETTING THE SESSION VARIABLE -- can cause an issue will see to it
		 * latter
		 */
		String name = principal.getName();
		User user = userService.findOne(name);

		session.setAttribute("currentUser", user);
		logger.info("currentUser = " + user.getName());
		/*
		 * Accepting help the data will be populate below the the right GET HELP
		 * column. Checking the Accep table if it a row having status id =1 and
		 * has a commit id Which means admin has associated an unprocessed
		 * commit to an unprocessed accept request. check:confDate=null and
		 * commit!=null set:confDate and status_id
		 */
		
		

		model.addAttribute("dayleft"+(20-user.getLife()), true);
		model.addAttribute("dayCount",user.getLife());
		

		model.addAttribute("giveHelpDataList",commitService.giveHelpData(user));
		model.addAttribute("giveHelpDataListCompleted", commitService.giveHelpDataCompleted(user));
		
		model.addAttribute("helpDataList", commitService.getHelpData(user));
		model.addAttribute("helpDataListCompleted", commitService.getHelpDataCompleted(user));
		
		return "memberZone";
	}
	
	
	
	@ModelAttribute("fileUpload")
	private FileUpload constructFileUpload() {
		return new FileUpload();
	}

	@RequestMapping(value = "/memberZone", method = RequestMethod.POST)
	public String doFileUpload(@RequestParam(value = "url") String url,
			@RequestParam(value = "commitId") Integer commitId,
			Principal principal, RedirectAttributes redirectAttributes) {

		logger.info("inside doFileUpload **************"+commitId);

		fileUploadService.save(url, commitId);
		redirectAttributes.addFlashAttribute("successUpload", true);
		return "redirect:/user/memberZone.html";
	}

	@RequestMapping(value = "/memberZone/viewSlip")
	@ResponseBody
	public String viewSlip(@RequestParam("id") Integer id) {
		
		  FileUpload upload = fileUploadService.findById(id);
		  logger.info("slip id : " + id);
		  
		 // byte[] image = fileUploadService.decodeImage(upload.getImage());
		  // logger.info("image : "+image); // byte[] imageBytes =
		  /*upload.getImage(); // String imgStr =
		  fileUploadService.encodeImage(imageBytes); byte[] imgBytes =
		  upload.getImage();
		  
		  byte[] encodeBase64 = org.apache.commons.codec.binary.Base64
		  .encodeBase64(imgBytes); String base64Encoded = null; try {
		  base64Encoded = new String(encodeBase64, "UTF-8"); } catch
		  (UnsupportedEncodingException e) { // TODO Auto-generated catch block
		  e.printStackTrace(); } logger.info("base64Encoded : " +
		  base64Encoded);
		  
		  <img alt="" src=""
		  style="width:150px;height: 150px;overflow: scroll;" >
		  */
		  /*
		  String res =
		  "<div style=\"height: 150px; overflow-x: auto;overflow-y: auto;\"><img alt=\"img desc\" src=\"data:image/jpeg;base64,"
		  + base64Encoded + "\"></div>";*/

		  String res =
		  "<div style=\"height: 150px; overflow-x: auto;overflow-y: auto;\"><img alt=\"img desc\" src=\""+upload.getUrl()+"\"/></div>";
		  
		 return res;
	}

	@RequestMapping(value = "/acceptPayment")
	public String acceptPayment(
			@RequestParam(value = "commitId") Integer commitId,
			RedirectAttributes redirectAttributes) {
		if (commitService.acceptPayment(commitId)) {
			redirectAttributes.addFlashAttribute("paymentAccepted", true);
			return "redirect:/user/memberZone.html";
		}
		redirectAttributes.addFlashAttribute("paymentNotAccepted", true);
		return "redirect:/user/memberZone.html";
	}
	
	@RequestMapping(value = "/memberZoneAccountLock",method = RequestMethod.POST)
	public String memberZoneAccountLock(
			@RequestParam(value = "currentUserId") Integer currentUserId,
			RedirectAttributes redirectAttributes) {
		if (userService.lockAccount(currentUserId)) {
			return "redirect:/logoutFromCode.html";
		}else{
		return "redirect:/user/memberZone.html";
		}
	}	
	
}
