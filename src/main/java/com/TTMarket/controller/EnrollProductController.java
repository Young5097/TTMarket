package com.TTMarket.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.TTMarket.dto.ProductDTO;
import com.TTMarket.service.ProductService;

@Controller
public class EnrollProductController {
    Logger logger = LoggerFactory.getLogger(getClass());

    ProductService productService;
    Date date;

    public EnrollProductController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/enrollProduct")
    public String enrollProduct(ModelMap model) {
        model.addAttribute("productDTO", new ProductDTO());
        return "enrollProduct";
    }

    @PostMapping("/enrollProduct")
    public  String enrollProductComplete(ProductDTO productDTO,
                                         BindingResult result) {
        if (result.hasErrors()) {
            return "enrollProduct";
        }
        
        // 업로드날짜 설정
        productDTO.setpDate(new Date());
        
        // 이미지파일 업로드 및 파일명 DB저장
        MultipartFile file = productDTO.getMultipartFile();
        if(!file.isEmpty()) {
        	String filename = file.getOriginalFilename();
        	logger.info(filename);
        	productDTO.setpImage(filename);
        	try {
        		file.transferTo(new File("C:\\study\\springboot_study\\sts-4.22.1.RELEASE\\workspace\\TTMarket\\src\\main\\resources\\static\\images", filename));
        	} catch (IOException | IllegalArgumentException e) {
        		e.printStackTrace();
        	}
        }
        logger.info(productDTO.toString());
        
        productService.enrollProduct(productDTO); 
        return "redirect:main";
    }
}

