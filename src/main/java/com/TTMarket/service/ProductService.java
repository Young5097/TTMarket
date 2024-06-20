package com.TTMarket.service;

import java.util.List;

import com.TTMarket.dto.ProductDTO;

public interface ProductService {
	public List<ProductDTO> productList();
	public int enrollProduct(ProductDTO productDTO);
	public ProductDTO findByProductNum(int product_num);
}
