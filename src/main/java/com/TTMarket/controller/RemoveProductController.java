package com.TTMarket.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.TTMarket.service.ProductService;

@Controller
public class RemoveProductController {

	ProductService productService;
	
	public RemoveProductController(ProductService productService) {
		this.productService = productService;
	}
	
	@PostMapping("removeProductController")
	public @ResponseBody String removeProductContorller(@RequestParam int product_num) {
		int n = productService.removeProduct(product_num);
		return "success";
	}
}
