package com.TTMarket.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.TTMarket.dto.DealDTO;

@Mapper
public interface DealMapper {
	public int saveDeal(DealDTO dealDTO);
	public String checkIsRequested(int product_num);
}
