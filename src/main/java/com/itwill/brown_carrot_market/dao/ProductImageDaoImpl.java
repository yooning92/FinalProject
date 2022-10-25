package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.mapper.ProductImageMapper;

@Repository(value = "productImageDaoImpl")
public class ProductImageDaoImpl implements ProductImageDao{
	
	@Autowired(required = true)
	private ProductImageMapper productImageMapper;
	
	public ProductImageDaoImpl() {
		System.out.println("### ProductImageDaoImpl : 디폴트 생성자 호출");
	}
	
	public ProductImageMapper geProductImageMapper() {
		return productImageMapper;
	}
	
	public void setProductImageMapper(ProductImageMapper productImageMapper) {
		System.out.println("### productImageDaoImpl : setProductImageMapper 호출");
		this.productImageMapper = productImageMapper;
	}

	@Override
	public List<ProductImage> selectProductImgList(int p_no) throws Exception {
		System.out.println("### productImageDaoImpl : selectProductImgList 호출");
		return productImageMapper.selectProductImgList(p_no);
	}

	@Override
	public ProductImage selectProductImgOne(int pi_no) throws Exception {
		System.out.println("### productImageDaoImpl : selectProductImgOne 호출");
		return productImageMapper.selectProductImgOne(pi_no);
	}

	@Override
	public int insertProductImg(ProductImage productImage) throws Exception {
		System.out.println("### productImageDaoImpl : insertProductImg 호출");
		return productImageMapper.insertProductImg(productImage);
	}

	@Override
	public int deleteProductImg(int p_no) throws Exception {
		System.out.println("### productImageDaoImpl : deleteProductImg 호출");
		return productImageMapper.deleteProductImg(p_no);
	}
	
	
	@Override
	public int insertProductListImg(List<ProductImage> productImageList) throws Exception {
		System.out.println("### productImageDaoImpl : insertProductListImg 호출");
		return productImageMapper.insertProductListImg(productImageList);
	}
	
	
	
}
