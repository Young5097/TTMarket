package com.TTMarket.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.TTMarket.dto.ProductDTO;
import com.TTMarket.service.ProductService;

@Controller
public class MainController {
    
    private final ProductService productService;

    public MainController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/main")
    public String main(Model model) {
        List<ProductDTO> productList = productService.productList();
        model.addAttribute("productList", productList);
        return "main";
    }

    @GetMapping("/search")
    public String searchProducts(@RequestParam String keyword, Model model) {
        List<ProductDTO> searchResults = productService.searchProducts(keyword);
        model.addAttribute("productList", searchResults);
        return "products/productsList"; // 적절한 뷰 이름으로 변경
    }
}
