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
	
	// userNickname 기준으로 내 제품조회
	@Override
	public List<ProductDTO> productMyList(String userNickname) {
		// TODO Auto-generated method stub
		return productMapper.productMyList(userNickname);
	}

	// 검색기능 조회
    @Override
    public List<ProductDTO> searchProducts(String keyword) {
        return productMapper.searchProducts(keyword);
    }


}
