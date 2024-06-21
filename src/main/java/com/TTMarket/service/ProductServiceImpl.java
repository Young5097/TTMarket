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

	@Override
	public ProductDTO findByProductNum(int product_num) {
		return productMapper.findByProductNum(product_num);
	}
	
	@Override
	public List<ProductDTO> productMyList(String userNickname) {
		return productMapper.productMyList(userNickname);
	}

	@Override
	public int updateProduct(ProductDTO productDTO) {
		return productMapper.updateProduct(productDTO);
	}

	@Override
	public int removeProduct(int product_num) {
		return productMapper.removeProduct(product_num);
	}

}
