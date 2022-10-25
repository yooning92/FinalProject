package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.WishList;

@Mapper
public interface WishListMapper {
	
	public List<WishList> selectWishListAll(String user_id);
	
	public WishList selectWishListOne(int wishlist_no);
	
	public int selectWishListCount(String user_id);
	
	public int insertWishList(WishList wishList);
	
	public int deleteWishList(int wishlist_no);
	
	public int checkWish(int p_no,String user_id);
	
	public int deleteWishPD(int p_no,String user_id);
	
	
}
