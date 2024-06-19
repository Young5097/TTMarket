package com.TTMarket.dto;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;

@Alias("UserDTO")
public class UserDTO {
	
	@NotEmpty(message = "이름 입력은 필수입니다.")
    private String userName;
	
	@NotEmpty(message = "전화번호 입력은 필수입니다.")
	@Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$", message = "전화번호는 000-0000-0000 형식이어야 합니다.")
    private String phoneNum;
    
    @NotEmpty(message = "닉네임 입력은 필수입니다.")
    @Size(min = 2, message = "닉네임은 2글자 이상 입력해야 합니다.")
    private String userNickname;
    
    @NotEmpty(message ="주소를 입력해주세요.")
    private String userAddress1;
    
    @NotEmpty(message ="주소를 입력해주세요.")
    private String userAddress2;
    
    @NotEmpty(message = "아이디 입력은 필수입니다.")
    @Size(min = 4, max = 20, message = "아이디는 4자 이상, 20자 이하로 입력해야 합니다.")
    private String userid;
    
    @NotEmpty(message = "비밀번호 입력은 필수입니다.")
    @Size(min = 4, message = "비밀번호는 4자 이상, 20자 이하로 입력해야 합니다.")
    private String passwd;
    private String passwd2;
    
    @NotEmpty(message = "이메일 입력은 필수입니다.")
    @Pattern(regexp = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$", message="이메일을 다시한번 확인해주세요.")
    private String email;
	
	public UserDTO() {}

	public UserDTO(String userName, String phoneNum, String userNickName, String userAddress1, String userAddress2,
			String userid, String passwd, String email) {
		this.userName = userName;
		this.phoneNum = phoneNum;
		this.userNickname = userNickName;
		this.userAddress1 = userAddress1;
		this.userAddress2 = userAddress2;
		this.userid = userid;
		this.passwd = passwd;
		this.email = email;
	}
	
	/////////////////////////////////////////
	public UserDTO(String passwd2) {
		super();
		this.passwd2 = passwd2;
	}
	public String getPasswd2() {
		return passwd2;
	}
	
	public void setPasswd2(String passwd2) {
		this.passwd2 = passwd2;
	}
	
	
	/////////////////////////////////////////


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
		return userNickname;
	}

	public void setUserNickName(String userNickName) {
		this.userNickname = userNickName;
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
		return "UserDTO [userName=" + userName + ", phoneNum=" + phoneNum + ", userNickname=" + userNickname
				+ ", userAddress1=" + userAddress1 + ", userAddress2=" + userAddress2 + ", userid=" + userid
				+ ", passwd=" + passwd + ", passwd2=" + passwd2 + ", email=" + email + "]";
	}



}
