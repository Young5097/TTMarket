package com.TTMarket.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CheckDealController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@PostMapping("putDeal")
	public @ResponseBody String putDeal(@RequestParam("product_num") String product_num,
						  				@RequestParam("userNickname") String userNickname,
						  				ModelMap model, Authentication auth) {
		String buyer_userid = auth.getName();
		
		
		
		System.out.println(product_num + " " + userNickname);
		System.out.println(buyer_userid);
		return "success";
	}
}




