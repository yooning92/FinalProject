package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.Review;

public interface ReviewDao {

	int createReview(Review review) throws Exception;
	
	int countReceivedReview(String user_id) throws Exception;
	
	List<Review> findReceivedReview(String user_id) throws Exception;
	
	List<Review> findReceivedReviewByBuyer(String user_id) throws Exception;
	
	List<Review> findReceivedReviewBySeller(String user_id) throws Exception;
	
	Review findReviewByRivewNo(int review_no);

	Review isExistedReviewByOrdersNoId(Review review) throws Exception;
	
	int removeReview(int review_no) throws Exception;
	
	int updateReview(Review review) throws Exception;
}
