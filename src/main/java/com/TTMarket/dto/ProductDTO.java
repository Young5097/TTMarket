package com.TTMarket.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("ProductDTO")
public class ProductDTO {
	private String pName; // 제품 명
	private String pCategory; // 제품 카테고리
	private int pPrice; // 제품 가격
	private String userNickname; // 유저 닉네임
	private String pLocation; // 거래위치
	private Date pDate; // 등록일자
	private boolean pIsTransaction=false; // 거래여부
	private String pImage;
	private String pExplain;
	
	private MultipartFile multipartFile;
	
	public ProductDTO() {}
	
	public ProductDTO(String pName, String pCategory, int pPrice, String userNickname, String pLocation, Date pDate,
			boolean pIsTransaction, String pImage, String pExplain, MultipartFile multipartFile) {
		this.pName = pName;
		this.pCategory = pCategory;
		this.pPrice = pPrice;
		this.userNickname = userNickname;
		this.pLocation = pLocation;
		this.pDate = pDate;
		this.pIsTransaction = pIsTransaction;
		this.pImage = pImage;
		this.pExplain=pExplain;
		this.multipartFile = multipartFile;
	}

	public String getpExplain() {
		return pExplain;
	}

	public void setpExplain(String pExplain) {
		this.pExplain = pExplain;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpCategory() {
		return pCategory;
	}

	public void setpCategory(String pCategory) {
		this.pCategory = pCategory;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getpLocation() {
		return pLocation;
	}

	public void setpLocation(String pLocation) {
		this.pLocation = pLocation;
	}

	public Date getpDate() {
		return pDate;
	}

	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}

	public boolean getpIsTransaction() {
		return pIsTransaction;
	}

	public void setpIsTransaction(boolean pIsTransaction) {
		this.pIsTransaction = pIsTransaction;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	@Override
	public String toString() {
		return "ProductDTO [pName=" + pName + ", pCategory=" + pCategory + ", pPrice=" + pPrice + ", userNickname="
				+ userNickname + ", pLocation=" + pLocation + ", pDate=" + pDate + ", pIsTransaction=" + pIsTransaction
				+ ", pImage=" + pImage + ", pExplain=" + pExplain + ", multipartfile=" + multipartFile + "]";
	}

	

	
}