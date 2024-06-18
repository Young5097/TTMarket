package com.TTMarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.TTMarket.dto.ProductDTO;

@Mapper
public interface ProductMapper {
	public List<ProductDTO> productList();
}
