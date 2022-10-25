package com.itwill.brown_carrot_market.service;

import java.util.List;

import com.itwill.brown_carrot_market.dto.WishList;

public interface WishListService {
   List<WishList> selectWishListAll(String user_id);
	
	WishList selectWishListOne(int wishlist_no);
	
	int selectWishListCount(String user_id);
	
	int insertWishList(WishList wishList);
	
	int deleteWishList(int wishlist_no);
	
	int checkWish(int p_no,String user_id);
	
	public int deleteWishPD(int p_no,String user_id);
}
