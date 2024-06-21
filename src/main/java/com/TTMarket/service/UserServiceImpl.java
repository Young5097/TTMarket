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

	@Override
	public UserDTO findById(String userid) {
		return userMapper.findById(userid);
	}

	@Override

	public UserDTO idCheck(String userid) {
		// TODO Auto-generated method stub
		return userMapper.idCheck(userid);
	}

	@Override
	public UserDTO userNicknameCheck(String userNickname) {
		// TODO Auto-generated method stub
		return userMapper.userNicknameCheck(userNickname);
	}

	@Override
	public UserDTO phoneNumCheck(String phoneNum) {
		// TODO Auto-generated method stub
		return userMapper.phoneNumCheck(phoneNum);
	}

	public String findNicknameById(String userid) {
		return userMapper.findNicknameById(userid);
	}

	@Override
	public UserDTO findId(String userid) {
		// TODO Auto-generated method stub
		return userMapper.findById(userid);
	}
	
    @Override
    public void updateUser(String userid, 
    		String phoneNum,
    		String email,
    		String userAddress1,
    		String userAddress2,
    		UserDTO userDTO) throws Exception {
        userMapper.updateUser(userid, phoneNum, email, userAddress1, userAddress2, userDTO);
    }

}
