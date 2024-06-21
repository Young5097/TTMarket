package com.TTMarket.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.TTMarket.dto.ProductDTO;

@Mapper
public interface ProductMapper {
	public List<ProductDTO> productList();
	public int enrollProduct(ProductDTO productDTO);
	public ProductDTO findByProductNum(int product_num);
	public List<ProductDTO> productMyList(String userNickname);
	public int updateProduct(ProductDTO productDTO);
}
