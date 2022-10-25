package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.ProductImage;

@Mapper
public interface ProductImageMapper {
	
	public List<ProductImage> selectProductImgList(int p_no);
	
	public ProductImage selectProductImgOne(int pi_no);
	
	public int insertProductImg(ProductImage productImage);
	
	public int insertProductListImg(List<ProductImage> productImageList);
	
	public int deleteProductImg(int p_no);
}
