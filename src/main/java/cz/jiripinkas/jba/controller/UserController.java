package cz.jiripinkas.jba.controller;

import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cz.jiripinkas.jba.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping("/logoutFromCode")
	public String logout(HttpServletRequest request) {
		SecurityContextHolder.getContext().setAuthentication(null);
		SecurityContextHolder.clearContext();
		HttpSession hs = request.getSession();
		Enumeration e = hs.getAttributeNames();
		while (e.hasMoreElements()) {
			String attr = (String) e.nextElement();
			hs.setAttribute(attr, null);
		}
		removeCookies(request);
		hs.invalidate();
		
		return "redirect:/invalidSession.html";
	}

	public void removeCookies(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				cookies[i].setMaxAge(0);
			}
		}
	}

	/*
	 * @RequestMapping(value="/account",method=RequestMethod.POST) public String
	 * doAddBlog(Model model ,@Valid @ModelAttribute("blog") Blog
	 * blog,BindingResult result, Principal principal){ if (result.hasErrors())
	 * { return account(model,principal); } String name = principal.getName();
	 * blogService.save(blog,name); return "redirect:/account.html"; }
	 * 
	 * @RequestMapping("/blog/remove/{id}") public String
	 * blogRemove(@PathVariable int id){ Blog blog = blogService.findOne(id);
	 * blogService.remove(blog); return "redirect:/account.html"; }
	 */
}
