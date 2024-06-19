package com.TTMarket.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TTMarket.dto.ProductDTO;
import com.TTMarket.service.ProductService;

@Controller
public class MainController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	ProductService productService;
	
	public MainController(ProductService productService) {
		this.productService = productService;
	}
	
	@GetMapping("/main")
	public String main(ModelMap model) {
		List<ProductDTO> productList = productService.productList();
//		logger.info(productList.toString());
		model.addAttribute("productList", productList);
		return "main";
	}
}
