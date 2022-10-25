package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.Review;
import com.itwill.brown_carrot_market.dto.ReviewImage;

public interface ReviewImageDao {
	
	
	//int insertProductListImg(ProductImage productImage)throws Exception;
	int insertReviewImgList(List<ReviewImage> reviewImageList) throws Exception;
	
	int removeReviewImgByNo(int review_img_no) throws Exception;
	
	int removeReviewImgByNoList(List<String> reviewImgNoList) throws Exception;
	
	int removeReviewImgByName(String review_img_name) throws Exception;
}
