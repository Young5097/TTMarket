package com.TTMarket.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.TTMarket.dto.DealDTO;
import com.TTMarket.service.DealService;
import com.TTMarket.service.UserService;

@Controller
public class CheckDealController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	UserService userService;
	DealService dealService;
	
	public CheckDealController(UserService userService,DealService dealService) {
		this.userService = userService;
		this.dealService = dealService;
	}
	
	@PostMapping("putDeal") 
	public @ResponseBody String putDeal(@RequestParam("product_num") int product_num, // 제품번호
						  				@RequestParam("userNickname") String userNickname, // seller 닉네임
						  				ModelMap model, Authentication auth,
						  				DealDTO dealDTO) {
		String buyer_userDTO = userService.findNicknameById(auth.getName()); // buyer 닉네임
		Date requestDate = new Date();
		
		// 각 거래정보요소 저장 및 DB 반영
		dealDTO.setProduct_num(product_num);
		dealDTO.setSeller_nick(userNickname);
		dealDTO.setBuyer_nick(buyer_userDTO);
		dealDTO.setRequestDealDate(requestDate);
		dealService.saveDeal(dealDTO);
		
		return "success";
	} // 거래신청 처리
}
