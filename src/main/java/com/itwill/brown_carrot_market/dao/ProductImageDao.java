package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.ProductImage;

public interface ProductImageDao {
	
	List<ProductImage> selectProductImgList(int p_no)throws Exception;
	
	ProductImage selectProductImgOne(int pi_no)throws Exception;
	
	int insertProductImg(ProductImage productImage)throws Exception;
	
	int insertProductListImg(List<ProductImage> productImageList)throws Exception;
	
	int deleteProductImg(int p_no)throws Exception;
}
