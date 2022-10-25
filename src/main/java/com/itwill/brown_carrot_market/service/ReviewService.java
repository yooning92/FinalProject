package com.itwill.brown_carrot_market.service;

import java.util.List;

import com.itwill.brown_carrot_market.dto.Review;

public interface ReviewService {
	
	int createReview(Review review) throws Exception;

	int countReceivedReview(String user_id) throws Exception;
	
	List<Review> findReceivedReview(String user_id) throws Exception;
	
	List<Review> findReceivedReviewByBuyer(String user_id) throws Exception;
	
	List<Review> findReceivedReviewBySeller(String user_id) throws Exception;
	
	Review findReviewByRivewNo(int review_no) throws Exception;
	
	Review isExistedReviewByOrdersNoId(Review review) throws Exception;
	
	int removeReview(int review_no) throws Exception;

	int removeReviewImgByNo(int review_no) throws Exception;
	
	int removeReviewImgByNoList(List<String> reviewImgNoList) throws Exception;
	int removeReviewImgByName(String review_img_name) throws Exception;
	
	int updateReview(Review review) throws Exception;
}
