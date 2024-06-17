package com.TTMarket.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.TTMarket.dto.UserDTO;
import com.TTMarket.mapper.UserMapper;

@Service
@Transactional
public class UserServiceImpl implements UserService {
	
	UserMapper userMapper;
	
	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	@Override
	public int save(UserDTO userDTO) {
		return userMapper.save(userDTO);
		
	}

}
