package com.TTMarket.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.TTMarket.dto.ProductDTO;
import com.TTMarket.dto.UserDTO;
import com.TTMarket.service.ProductService;
import com.TTMarket.service.UserService;

@Controller
@SessionAttributes(names = {"login", "userid", "email" ,"userNickname", "phoneNum", "userAddress1", "userAddress2", "productList"})
public class UpdateProductController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private UserService userService;
    private ProductService productService;

    public UpdateProductController(UserService userService, ProductService productService) {
        this.userService = userService;
        this.productService = productService;
    }
    
    @GetMapping("updateProduct")
    public String updateProduct(@RequestParam("product_num") int product_num,
								ModelMap model) {
		ProductDTO productDTO = productService.findByProductNum(product_num);
		productDTO.setFormattedDate(formmatedDate(productDTO.getpDate()));
		model.addAttribute("productDTO", productDTO);
    	return "updateProduct";
    }
    
    @PostMapping("updateProduct")
    public String updateProductComplete(@RequestParam int product_num,
    									@ModelAttribute ProductDTO updatedProductDTO,
    									ModelMap model) {
    	
        // 이미지파일 업로드 및 파일명 DB저장
        MultipartFile file = updatedProductDTO.getMultipartFile();
        if(!file.isEmpty()) {
        	String filename = file.getOriginalFilename();
        	logger.info(filename);
        	updatedProductDTO.setpImage(filename);
        	try {
//        		file.transferTo(new File("C:\\springboot_study\\sts-4.22.1.RELEASE\\workspace\\TTMarket\\src\\main\\resources\\static\\images", filename));
        		file.transferTo(new File("C:\\study\\springboot_study\\sts-4.22.1.RELEASE\\workspace\\TTMarket\\src\\main\\resources\\static\\images", filename));
        	} catch (IOException | IllegalArgumentException e) {
        		e.printStackTrace();
        	}
        } else {
        	String pImage = productService.findByProductNum(product_num).getpImage();
        	updatedProductDTO.setpImage(pImage);
        }
        
        logger.info(updatedProductDTO.toString());
        productService.updateProduct(updatedProductDTO);
    	return "redirect:mypage";
    }
    
	// Aspect로 Date 날짜포맷 바꾸는거 넣기 -> aop로 바꾸기
	public String formmatedDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(date);
	}
}
