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

}
