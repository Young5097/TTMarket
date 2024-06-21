package com.TTMarket.service;

import com.TTMarket.dto.UserDTO;

public interface UserService {
	public int save(UserDTO userDTO);
	public UserDTO findById(String userid);

	public UserDTO idCheck(String userid); // 아이디 중복체크
	public UserDTO userNicknameCheck(String userNickname); // 닉네임 중복체크
	public UserDTO phoneNumCheck(String phoneNum); // 전화번호 중복체크

	public String findNicknameById(String userid);
	public UserDTO findId(String userid);
	
	void updateUser(String userid, String phoneNum, String email, String userAddress1, String userAddress2, UserDTO userDTO) throws Exception;

}
