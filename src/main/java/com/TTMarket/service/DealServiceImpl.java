package com.TTMarket.service;

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

}
