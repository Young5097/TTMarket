package com.TTMarket.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	
    @GetMapping("/")
    public String showLoginPage() {
        return "loginForm";
    }
//	@GetMapping("/login_success")
//	public String login_success() {
//		logger.info("logger:showlogin_successPage");
//		return "redirect:main";
//	}
	
	@GetMapping("/login_fail")
	public String login_fail() {
		logger.info("logger:showlogin_failPage");
		return "redirect:";
	}
}
