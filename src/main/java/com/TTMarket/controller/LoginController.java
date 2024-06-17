package com.TTMarket.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
    @GetMapping("/")
    public String showLoginPage() {
        return "loginForm";
    }
	@GetMapping("/login_success")
	public String login_success() {
		logger.info("logger:showlogin_successPage");
		return "redirect:main";
	}
	
	@GetMapping("/login_fail")
	public String login_fail() {
		logger.info("logger:showlogin_failPage");
		return "redirect:";
	}
}
