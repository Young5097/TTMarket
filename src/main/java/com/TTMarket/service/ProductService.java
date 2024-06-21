package com.TTMarket.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.TTMarket.dto.ProductDTO;

public interface ProductService {
	public List<ProductDTO> productList();
	public int enrollProduct(ProductDTO productDTO);
	public ProductDTO findByProductNum(int product_num);
	public List<ProductDTO> productMyList(String userNickname);
	public int updateProduct(ProductDTO productDTO);
	@Transactional
	public int removeProduct(int product_num);
}
