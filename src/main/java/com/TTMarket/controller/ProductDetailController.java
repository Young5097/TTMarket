package com.TTMarket.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TTMarket.dto.ProductDTO;
import com.TTMarket.service.ProductService;

@Controller
public class ProductDetailController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	ProductService productService;
	public ProductDetailController(ProductService productService) {
		this.productService = productService;
	}
	
	@GetMapping("productDetail")
	public String productDetail(@RequestParam int product_num,
								ModelMap model) {
		ProductDTO productDTO = productService.findByProductNum(product_num);
		productDTO.setFormattedDate(formmatedDate(productDTO.getpDate()));
		model.addAttribute("productDTO", productDTO);
		return "productDetail";
	}
	
	// Aspect로 Date 날짜포맷 바꾸는거 넣기 -> aop로 바꾸기
	public String formmatedDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
}




