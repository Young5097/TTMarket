package com.TTMarket.mapper;

import org.apache.ibatis.annotations.Mapper;


import com.TTMarket.dto.UserDTO;

@Mapper
public interface UserMapper {
	public int save(UserDTO userDTO);
	public UserDTO findById(String userid);
	public UserDTO idCheck(String userid); // 아이디 중복체크
	public UserDTO userNicknameCheck(String userNickname); // 닉네임 중복체크
	public UserDTO phoneNumCheck(String phoneNum); // 전화번호 중복체크	
}
