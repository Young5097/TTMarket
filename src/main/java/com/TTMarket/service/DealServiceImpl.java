package com.TTMarket.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.TTMarket.dto.DealDTO;
import com.TTMarket.mapper.DealMapper;

@Service
public class DealServiceImpl implements DealService {
	DealMapper dealMapper;
	
	public DealServiceImpl(DealMapper dealMapper) {
		this.dealMapper = dealMapper;
	}
	
	@Override
	public int saveDeal(DealDTO dealDTO) {
		return dealMapper.saveDeal(dealDTO);
	}

	@Override
	public List<String> checkIsRequested(int product_num) {
		return dealMapper.checkIsRequested(product_num);
	}

	@Override
	public List<DealDTO> findDealToSeller(Map<String, Object> map) {
		return dealMapper.findDealToSeller(map);
	}

	@Override
	public int selectBuyer(Map<String, Object> map) {
		return dealMapper.selectBuyer(map);
	}

	@Override
	public List<DealDTO> selectDealInfo(String userNickname) {
		return dealMapper.selectDealInfo(userNickname);
	}

	@Override
	public int dealCompleteBuyer(Map<String, Object> map) {		
		return dealMapper.dealCompleteBuyer(map);
	}
	
	@Override
	public int dealCompleteSeller(Map<String, Object> map) {		
		return dealMapper.dealCompleteSeller(map);
	}

	@Override
	public int updateIsTransaction(Map<String, Object> map) {
		return dealMapper.updateIsTransaction(map);
	}

}
