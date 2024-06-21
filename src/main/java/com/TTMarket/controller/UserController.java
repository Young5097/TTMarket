package com.TTMarket.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.TTMarket.dto.UserDTO;
import com.TTMarket.service.UserService;

@Controller
//@RestController
//@SessionAttributes(names= {"userid"})
@SessionAttributes(names= {"login"})
public class UserController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	UserService userService;
	
	public UserController(UserService userService) {
		this.userService = userService;
	}
	
	@GetMapping("/signup")
	public String showSignUpForm(ModelMap model) {
		model.addAttribute("userDTO", new UserDTO());
		return "userForm";
	}
	
	@PostMapping("/signup")
	public String showSignUpSuccessPage(@Valid UserDTO userDTO, 
	        BindingResult result) {
	    logger.info("logger:{}", userDTO);
	    if(result.hasErrors()) {
	        return "userForm";
	    }
	    
	    //서비스 연동
	    String encptPw = 
	            new BCryptPasswordEncoder().encode(userDTO.getPasswd());
	    userDTO.setPasswd(encptPw);
	    
	    
	    int n = userService.save(userDTO);
	    return "redirect:/"; // 회원가입 성공 후 메인 페이지로 리다이렉트
	}

	
    @GetMapping("/idCheck")
    @ResponseBody
    public String idCheck(@RequestParam String userid) {
        logger.info("idCheck 호출됨: {}", userid);
        try {
            UserDTO dto = userService.idCheck(userid);
            if (dto != null) {
            	return  "중복된 아이디입니다.";
            } else {
            	return "사용 가능한 아이디입니다.";
            }
        } catch (Exception e) {
            logger.error("idCheck 처리 중 오류 발생: ", e);
            return "서버 오류: " + e.getMessage();
        }
    }
    
    @GetMapping("/userNicknameCheck")
    @ResponseBody
    public String userNicknameCheck(@RequestParam String userNickname) {
    	logger.info("닉네임 중복 체크 요청: {}", userNickname);
        try {
            UserDTO dto = userService.userNicknameCheck(userNickname);
            if (dto != null) {
                return "중복된 닉네임입니다.";
            } else {
                return "사용 가능한 닉네임입니다.";
            }
        } catch (Exception e) {
            logger.error("닉네임 중복 체크 오류 발생", e);
            return "서버 오류: " + e.getMessage();
        }
    }
    
//    @GetMapping("/mypage")
//    public String myPage(@ModelAttribute ModelMap model, HttpSession session) {
//        // 세션에서 로그인 정보 가져오기
//        UserDTO dto = (UserDTO) session.getAttribute("userid");
//        logger.info("로그인 정보: {}", dto);
//        
//        if (dto == null) {
//            // 로그인 되어있지 않으면 로그인 페이지로 리다이렉트
//            return "redirect:/login";
//        }
//        
//        // 로그인 정보의 아이디로 사용자 정보 조회
//        UserDTO userDTO = userService.mypage(dto); // 수정된 부분
//        model.addAttribute("userDTO", userDTO); // mypage.jsp에서 사용할 userDTO 속성 추가
//        
//        return "mypage"; // mypage.jsp 파일을 반환
//    }



}



