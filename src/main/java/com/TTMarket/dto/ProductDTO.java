package com.TTMarket.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("ProductDTO")
public class ProductDTO {
	private int product_num;
	private String pName; // 제품 명
	private String pCategory; // 제품 카테고리
	private int pPrice; // 제품 가격
	private String userNickname; // 유저 닉네임
	private String pLocation; // 거래위치
	private String pLocation2; // 상세위치
	private Date pDate; // 등록일자
	private boolean pIsTransaction; // 거래여부
	private String pImage;
	private String pExplain;
	
	// 사진파일 입력
	private MultipartFile multipartFile;
	// 출력날짜 변경
	private String formattedDate;
	
	public ProductDTO() {}
	
	public ProductDTO(int product_num, String pName, String pCategory, int pPrice, String userNickname, String pLocation, 
			String pLocation2, Date pDate,
			boolean pIsTransaction, String pImage, String pExplain, MultipartFile multipartFile) {
		this.product_num = product_num;
		this.pName = pName;
		this.pCategory = pCategory;
		this.pPrice = pPrice;
		this.userNickname = userNickname;
		this.pLocation = pLocation;
		this.pLocation2 = pLocation2;
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
	
	public String getpLocation2() {
		return pLocation2;
	}

	public void setpLocation2(String pLocation2) {
		this.pLocation2 = pLocation2;
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

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public String getFormattedDate() {
		return formattedDate;
	}

	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}

	@Override
	public String toString() {
		return "ProductDTO [product_num=" + product_num + ", pName=" + pName + ", pCategory=" + pCategory + ", pPrice="
				+ pPrice + ", userNickname=" + userNickname + ", pLocation=" + pLocation + ", pLocation2=" + pLocation2
				+ ", pDate=" + pDate + ", pIsTransaction=" + pIsTransaction + ", pImage=" + pImage + ", pExplain="
				+ pExplain + ", multipartFile=" + multipartFile + ", formattedDate=" + formattedDate + "]";
	}

	
}