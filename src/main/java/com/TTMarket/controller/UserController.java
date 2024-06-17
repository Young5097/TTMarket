package com.TTMarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("/signup")
	public String showSignUpForm(ModelMap model) {
		
		return "userForm";
	}
}
