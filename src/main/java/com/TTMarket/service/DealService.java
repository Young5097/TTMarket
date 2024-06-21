package com.TTMarket.service;

import com.TTMarket.dto.DealDTO;

public interface DealService {
	public int saveDeal(DealDTO dealDTO);
	public String checkIsRequested(int product_num);
}
