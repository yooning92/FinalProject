package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.Review;

@Mapper
public interface ReviewMapper {

	/*
	 * @Insert("")
	 */
	public int createReview(Review review);

	public int countReceivedReview(String user_id);
	
	public List<Review> findReceivedReview(String user_id);

	public List<Review> findReceivedReviewByBuyer(String user_id);

	public List<Review> findReceivedReviewBySeller(String user_id);

	public Review findReviewByRivewNo(int review_no);

	public Review isExistedReviewByOrdersNoId(Review review);
	
	public int removeReview(int review_no);
	
	public int updateReview(Review review);
	
}
