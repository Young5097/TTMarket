package com.TTMarket.service;

import java.util.List;
import java.util.Map;

import com.TTMarket.dto.DealDTO;

public interface DealService {
	public int saveDeal(DealDTO dealDTO);
	public List<String> checkIsRequested(int product_num);
	
	// 판매자 닉네임, 판매번호로 구매신청내역 찾기
	public List<DealDTO> findDealToSeller(Map<String,Object> map);
	
	// 구매확정
	public int selectBuyer(Map<String,Object> map);
	
	// 거래신청내역확인
	public List<DealDTO> selectDealInfo(String userNickname);
}
