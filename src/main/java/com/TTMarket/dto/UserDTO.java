package com.TTMarket.dto;

import org.apache.ibatis.type.Alias;

@Alias("UserDTO")
public class UserDTO {
	String userName;
	String phoneNum;
	String userNickName;
	String userAddress1;
	String userAddress2;
	String userid;
	String passwd;
	String email;
	
	public UserDTO() {}

	public UserDTO(String userName, String phoneNum, String userNickName, String userAddress1, String userAddress2,
			String userid, String passwd, String email) {
		this.userName = userName;
		this.phoneNum = phoneNum;
		this.userNickName = userNickName;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "UserDTO [userName=" + userName + ", phoneNum=" + phoneNum + ", userNickName=" + userNickName
				+ ", userAddress1=" + userAddress1 + ", userAddress2=" + userAddress2 + ", userid=" + userid
				+ ", passwd=" + passwd + ", email=" + email + "]";
	}
	
	
	
}
