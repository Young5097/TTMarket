package com.TTMarket.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.TTMarket.dto.UserDTO;

@Mapper
public interface UserMapper {
	public int save(UserDTO userDTO);
	public UserDTO findById(String userid);
	public String findNicknameById(String userid);
}
