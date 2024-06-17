package com.TTMarket.controller;

import javax.validation.Valid;

import org.apache.catalina.realm.JNDIRealm.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.TTMarket.dto.UserDTO;
import com.TTMarket.service.UserService;

@Controller
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/signup")
	public String showSignUpForm(ModelMap model) {
		model.addAttribute("userDTO", new UserDTO());
		return "userForm";
	}
	
	@PostMapping(value={"/signup"})
	public String showSignUpSuccessPage(@Valid UserDTO userDTO, 
			BindingResult result) {
		logger.debug("logger:{}", userDTO);
		
		if(result.hasErrors()) {
			return "memberForm";
		}

		return "redirect:";
	}
}
