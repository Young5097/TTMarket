package com.TTMarket.service;

import com.TTMarket.dto.UserDTO;
import com.TTMarket.mapper.UserMapper;

public class UserServiceImpl implements UserService {
	
	UserMapper userMapper;
	
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Override
	public int save(UserDTO userDTO) {
		int n = userMapper.save(userDTO);
		return n;
	}

}
