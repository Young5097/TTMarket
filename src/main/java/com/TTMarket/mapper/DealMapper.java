package com.TTMarket.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.TTMarket.dto.DealDTO;

@Mapper
public interface DealMapper {
	public int saveDeal(DealDTO dealDTO);
	public List<String> checkIsRequested(int product_num);
	public List<DealDTO> findDealToSeller(Map<String,Object> map);
	public int selectBuyer(Map<String,Object> map);
	public List<DealDTO> selectDealInfo(String userNickname);
}
