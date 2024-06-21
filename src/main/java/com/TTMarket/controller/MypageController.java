package com.TTMarket.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.TTMarket.dto.ProductDTO;
import com.TTMarket.dto.UserDTO;
import com.TTMarket.service.ProductService;
import com.TTMarket.service.UserService;

@Controller
@SessionAttributes(names = {"userid", "email" ,"userNickname", "phoneNum", "userAddress1", "userAddress2", "productList"})
public class MypageController {

    private Logger logger = LoggerFactory.getLogger(getClass());

    private final UserService userService;
    @Autowired
    private ProductService productService;


    @Autowired
    public MypageController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/mypage")
    public String mypage(ModelMap model) {
        String userid = (String) model.get("userid"); // 세션에서 로그인 아이디 가져오기
        String userNickname = userService.findNicknameById(userid); 
        
        if (userid == null) {
            logger.error("세션에서 로그인 아이디를 가져올 수 없습니다.");
            
            return "redirect:/"; // 로그인 페이지로 리다이렉트
        }

        try {
            UserDTO userDTO = userService.findId(userid); // 사용자 정보 가져오기
            

            if (userDTO != null) {
                // 사용자 정보를 모델에 추가
                model.addAttribute("userNickname", userDTO.getUserNickName());
                model.addAttribute("phoneNum", userDTO.getPhoneNum());
                model.addAttribute("email", userDTO.getEmail());
                model.addAttribute("userAddress1", userDTO.getUserAddress1());
                model.addAttribute("userAddress2", userDTO.getUserAddress2());

                // 사용자의 상품 리스트 가져오기
                List<ProductDTO> productList = productService.productMyList(userDTO.getUserNickName());
                model.addAttribute("productList", productList);

                System.out.println("========================");
        	    System.out.println(userDTO.toString());
                logger.info("사용자 정보를 성공적으로 조회하였습니다. userNickname: {}", userDTO.getUserNickName());
                logger.info("사용자 정보를 성공적으로 조회하였습니다. phoneNum: {}", userDTO.getPhoneNum());
                logger.info("사용자 정보를 성공적으로 조회하였습니다. email: {}", userDTO.getEmail());
                logger.info("사용자 정보를 성공적으로 조회하였습니다. userAddress1: {}", userDTO.getUserAddress1());
                logger.info("사용자 정보를 성공적으로 조회하였습니다. userAddress2: {}", userDTO.getUserAddress2());
            } else {
                logger.error("사용자 정보를 찾을 수 없습니다. userid: {}", userid);
                // 사용자 정보가 없을 경우, 적절한 처리를 수행 (예: 에러 페이지로 이동)
                model.addAttribute("userNickname", "사용자 정보를 찾을 수 없습니다.");
                model.addAttribute("phoneNum", "전화번호를 찾을 수 없습니다.");
                model.addAttribute("email", "이메일을 찾을 수 없습니다.");
                model.addAttribute("userAddress1", "주소를 찾을 수 없습니다.");
                model.addAttribute("userAddress2", "상세 주소를 찾을 수 없습니다.");
                // product 리스트도 추가

                 model.addAttribute("productList", new ArrayList<>()); // 빈 리스트를 넘김
            }

            model.addAttribute("userid", userid);

            return "mypage"; // mypage.jsp로 이동
        } catch (Exception e) {
            logger.error("마이페이지 조회 중 오류 발생: {}", e.getMessage(), e);
            // 예외 처리를 통해 적절한 오류 페이지로 리다이렉트 또는 메시지를 반환
            model.addAttribute("errorMessage", "마이페이지를 조회하는 중 오류가 발생했습니다.");
            return "error"; // 예시로 error.jsp로 이동
        }
    }
    
    @PostMapping("/updateUserInfo")
    public String updateUserInfo(@ModelAttribute UserDTO updatedUserDTO, ModelMap model) {
        String userid = (String) model.get("userid");

        if (userid == null) {
            logger.error("세션에서 로그인 아이디를 가져올 수 없습니다.");
            return "redirect:/"; // 로그인 페이지로 리다이렉트
        }

        try {
            // 사용자 정보 업데이트 처리
        	userService.updateUser(userid, 
        			updatedUserDTO.getPhoneNum(), 
        			updatedUserDTO.getEmail(), 
        			updatedUserDTO.getUserAddress1(), 
        			updatedUserDTO.getUserAddress2(), 
        			updatedUserDTO);

            // 업데이트된 사용자 정보 다시 조회
            UserDTO userDTO = userService.findId(userid);

            // 업데이트된 정보를 모델에 다시 추가
            model.addAttribute("userNickname", userDTO.getUserNickName());
            model.addAttribute("phoneNum", userDTO.getPhoneNum());
            model.addAttribute("email", userDTO.getEmail());
            model.addAttribute("userAddress1", userDTO.getUserAddress1());
            model.addAttribute("userAddress2", userDTO.getUserAddress2());

            logger.info("사용자 정보를 성공적으로 업데이트하였습니다.");


            return "redirect:/mypage"; // 마이페이지로 리다이렉트
        } catch (Exception e) {
            logger.error("사용자 정보 업데이트 중 오류 발생: {}", e.getMessage(), e);
            model.addAttribute("errorMessage", "사용자 정보 업데이트 중 오류가 발생했습니다.");
            return "error"; // error.jsp로 이동
        }
    }
}
