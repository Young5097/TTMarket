package com.TTMarket.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.TTMarket.dto.ProductDTO;
import com.TTMarket.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {
	ProductMapper productMapper;
	
	public ProductServiceImpl(ProductMapper productMapper) {
		this.productMapper = productMapper;
	}
	
	@Override
	public List<ProductDTO> productList() {
		return productMapper.productList();
	}

	@Override
	public int enrollProduct(ProductDTO productDTO) {
		return productMapper.enrollProduct(productDTO);
	}

}
