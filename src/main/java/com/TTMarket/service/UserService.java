package com.TTMarket.service;

import com.TTMarket.dto.UserDTO;

public interface UserService {
	public int save(UserDTO userDTO);
	public UserDTO findById(String userid);
}
