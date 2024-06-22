package com.TTMarket.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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
	public @ResponseBody String putDeal(@RequestParam("product_num") int product_num, // 중고제품등록번호
						  				@RequestParam("userNickname") String userNickname, // seller 닉네임
						  				ModelMap model, Authentication auth,
						  				DealDTO dealDTO) {
		String buyer_userNickname = userService.findNicknameById(auth.getName()); // buyer 닉네임
		
		// 자신이 올린 상품 구매불가
		if (userNickname.equals(buyer_userNickname)) {
			return "fail";
		}
		// 이미 거래신청한 제품이면 신청불가
		if (dealService.checkIsRequested(product_num).contains(buyer_userNickname)) {
			return "fail2";
		}
		Date requestDate = new Date();
		
		// 각 거래정보요소 저장 및 DB 반영
		dealDTO.setProduct_num(product_num);
		dealDTO.setSeller_nick(userNickname);
		dealDTO.setBuyer_nick(buyer_userNickname);
		dealDTO.setRequestDealDate(requestDate);
		dealService.saveDeal(dealDTO);
		
		return "success";
	} // 거래신청 처리
	
	// 판매자가 받은 거래신청내역확인
	@PostMapping("dealRequestList")
	public String dealRequestList(@RequestParam int product_num,
								  @RequestParam String userNickname,
								  ModelMap model) {
		Map<String,Object> map = new HashMap<>();
		map.put("product_num", product_num);
		map.put("seller_nick", userNickname);
		
		List<DealDTO> dealList = dealService.findDealToSeller(map);
		model.addAttribute("dealList", dealList);
		return "dealRequestList";
	}
	
	@PostMapping("selectBuyer")
	public String selectBuyer(@RequestParam int product_num,
	                        @RequestParam String buyer_nick) {
	    Map<String,Object> map = new HashMap<>();
	    map.put("product_num", product_num);
	    map.put("buyer_nick", buyer_nick);
	    
	    int n = dealService.selectBuyer(map);
	    logger.info("거래확정 : {}", buyer_nick);
	        
	    return "success";
	}	
	

}
