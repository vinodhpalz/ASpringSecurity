package controller;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {

	@RequestMapping(value = {"/", "/welcome**" } , method=RequestMethod.GET)
	public String defaultPage(Model m)
	{
		m.addAttribute("title","Spring Security Login Form");
		m.addAttribute("message","This is Default Page");
		return "hello";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value="logout", required=false) String logout, Model m)
	{
		if(error != null) {
			m.addAttribute("error", "Invalid username and password!");
		}
		
		if(logout != null) {
			m.addAttribute("msg", "You have been logged out successfully");
		}
		return "login";
	}
	
	@RequestMapping(value="/403", method=RequestMethod.GET)
	public String accessDenied(Model m)
	{
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if(!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			m.addAttribute("username",userDetail.getUsername());
		}
		return "403";
	}
	
	@RequestMapping(value="/admin**", method=RequestMethod.GET)
	public String adminpage(Model m)
	{
		m.addAttribute("title", "Spring Security Login Form");
		m.addAttribute("message", "This page is for ROLE_ADMIN only");
		return "admin";
	}

}
