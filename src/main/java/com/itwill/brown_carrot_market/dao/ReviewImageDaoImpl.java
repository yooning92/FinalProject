package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.Review;
import com.itwill.brown_carrot_market.dto.ReviewImage;
import com.itwill.brown_carrot_market.mapper.ProductImageMapper;
import com.itwill.brown_carrot_market.mapper.ReviewImageMapper;

@Repository(value = "reviewImageDaoImpl")
public class ReviewImageDaoImpl implements ReviewImageDao{
	
	@Autowired(required = true)
	private ReviewImageMapper reviewImageMapper;

	@Override
	public int insertReviewImgList(List<ReviewImage> reviewImageList)
			throws Exception {
		return reviewImageMapper.insertReviewImgList(reviewImageList);
	}

	@Override
	public int removeReviewImgByNo(int review_img_no) throws Exception {
		return reviewImageMapper.removeReviewImgByNo(review_img_no);
	}

	@Override
	public int removeReviewImgByNoList(List<String> reviewImgNoList) throws Exception {
		return reviewImageMapper.removeReviewImgByNoList(reviewImgNoList);
	}

	@Override
	public int removeReviewImgByName(String review_img_name) throws Exception {
		return reviewImageMapper.removeReviewImgByName(review_img_name);
	}

	
}
