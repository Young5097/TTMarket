package com.TTMarket.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

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
	
	// 구매자 거래확인
	public int dealCompleteBuyer(Map<String, Object> map);
	
	// 판매자 거래확인
	public int dealCompleteSeller(Map<String, Object> map);
	
	// 제품 판매여부 ( join mapper로 구분안함 )
	public int updateIsTransaction(Map<String, Object> map);
}
