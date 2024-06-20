package com.TTMarket.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.SessionAttributes;

import com.TTMarket.dto.UserDTO;

import com.TTMarket.dto.UserDTO;
import com.TTMarket.service.UserService;

@Controller

//@SessionAttributes(names= {"login"})
@SessionAttributes(names= {"userid"})
public class LoginController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	UserService userService;
	
    public LoginController(UserService userService) {
		super();
		this.userService = userService;
	}
	@GetMapping("/")
    public String showLoginPage() {
        return "loginForm";
    }
    
	@GetMapping("/login_success")
	public String login_success(ModelMap model, Authentication auth) {
		String userid = auth.getName();
		model.addAttribute("userid", userid);
		logger.debug("logger:showlogin_successPage");		
		return "redirect:main";
	}
	
	@GetMapping("/login_fail")
	public String login_fail() {
		logger.info("logger:showlogin_failPage");
		return "redirect:";
	}
	
}
