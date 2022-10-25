package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.WishList;
import com.itwill.brown_carrot_market.mapper.WishListMapper;

@Repository(value = "wishListDaoImpl")
public class WishListDaoImpl implements WishListDao{
	
	@Autowired(required = true)
	private WishListMapper wishListMapper;
	
	public WishListDaoImpl() {
		System.out.println("### WishListDaoImpl() : 디폴트 생성자 호출");
	}
	
	public WishListMapper getWishListMapper() {
		return wishListMapper;
	}

	public void setWishListMapper(WishListMapper wishListMapper) {
		System.out.println("### wishListDaoImpl : setWishListMapper 호출");
		this.wishListMapper = wishListMapper;
	}

	@Override
	public List<WishList> selectWishListAll(String user_id)  {
		System.out.println("### wishListDaoImpl : selectWishListAll 호출");
		return wishListMapper.selectWishListAll(user_id);
	}

	@Override
	public WishList selectWishListOne(int wishlist_no) {
		System.out.println("### wishListDaoImpl : selectWishListOne 호출");
		return wishListMapper.selectWishListOne(wishlist_no);
	}

	@Override
	public int selectWishListCount(String user_id) {
		System.out.println("### wishListDaoImpl : selectWishListCount 호출");
		return wishListMapper.selectWishListCount(user_id);
	}

	@Override
	public int insertWishList(WishList wishList)  {
		System.out.println("### wishListDaoImpl : insertWishList 호출");
		return wishListMapper.insertWishList(wishList);
	}

	@Override
	public int deleteWishList(int wishlist_no) {
		System.out.println("### wishListDaoImpl : deleteWishList 호출");
		return wishListMapper.deleteWishList(wishlist_no);
	}

	@Override
	public int checkWish(int p_no, String user_id) {
		// TODO Auto-generated method stub
		return wishListMapper.checkWish(p_no, user_id);
	}

	@Override
	public int deleteWishPD(int p_no, String user_id) {
		// TODO Auto-generated method stub
		return wishListMapper.deleteWishPD(p_no, user_id);
	}
	
	
	
}
