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
	// 검색기능 조회
	List<ProductDTO> searchProducts(String keyword);
}
