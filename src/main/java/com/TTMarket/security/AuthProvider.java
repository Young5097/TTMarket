package com.TTMarket.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.TTMarket.dto.UserDTO;
import com.TTMarket.service.UserService;

@Component
public class AuthProvider implements AuthenticationProvider {
	@Autowired
	UserService	userService;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		String userid = (String)authentication.getPrincipal(); // name="userid" 값
		String passwd = (String)authentication.getCredentials(); // name="passwd" 값
		
		
		UserDTO userDTO = userService.findById(userid); // 계정이없으면 null
//		String encrptPw = mem.getPasswd(); // NullPointerException 발생되기 때문에 사용안됨
		
		//Authentication 하위클래스 => token은 실제 저장되는 데이터
		//로그인 성공시
		UsernamePasswordAuthenticationToken token=null;
		if(userDTO!=null && new BCryptPasswordEncoder().matches(passwd, userDTO.getPasswd())) {
			
			List<GrantedAuthority> list = new ArrayList<>();
			// ROLE 설정시 사용되
			list.add(new SimpleGrantedAuthority("USER")); // ADMIN
			
			//암호화된 비번대신에 raw 비번으로 설정
			userDTO.setPasswd(passwd);
			token = new UsernamePasswordAuthenticationToken(userDTO, null, list);
//			token = new UsernamePasswordAuthenticationToken(men, null);
//			token = new UsernamePasswordAuthenticationToken(Principal, Credentical);
			return token;
		}
		//로그인 실패시
		throw new BadCredentialsException("비밀번호가 일치하지 않습니다. 다시 확인하세요.");
		
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return true;
	}
}




