package com.itwill.brown_carrot_market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.WishListDao;
import com.itwill.brown_carrot_market.dto.WishList;
@Service
public class WishListServiceImpl implements WishListService {
	
	@Autowired
	WishListDao wishListDao;

	@Override
	public List<WishList> selectWishListAll(String user_id) {
		return wishListDao.selectWishListAll(user_id);
	}

	@Override
	public WishList selectWishListOne(int wishlist_no) {
		// TODO Auto-generated method stub
		return wishListDao.selectWishListOne(wishlist_no);
	}

	@Override
	public int selectWishListCount(String user_id) {
		// TODO Auto-generated method stub
		return wishListDao.selectWishListCount(user_id);
	}

	@Override
	public int insertWishList(WishList wishList) {
		// TODO Auto-generated method stub
		return wishListDao.insertWishList(wishList);
	}

	@Override
	public int deleteWishList(int wishlist_no) {
		// TODO Auto-generated method stub
		return wishListDao.deleteWishList(wishlist_no);
	}

	@Override
	public int checkWish(int p_no, String user_id) {
		// TODO Auto-generated method stub
		return wishListDao.checkWish(p_no, user_id);
	}

	@Override
	public int deleteWishPD(int p_no, String user_id) {
		// TODO Auto-generated method stub
		return wishListDao.deleteWishPD(p_no, user_id);
	}

}
