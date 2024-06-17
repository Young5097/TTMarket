package com.TTMarket.dto;

import org.apache.ibatis.type.Alias;

@Alias("ProductDTO")
public class ProductDTO {

	int product_num; // 제품 번호
	
	String pName; // 제품 명
	
	String pCategory; // 제품 카테고리
	
	int pPrice; // 제품 가격
	
	String userNickname; // 유저 닉네임
	
	String pLocation; // 거래위치
	
	String pDate; // 등록일자
	
	String pIsTransaction; // 거래여부
}