package com.itwill.brown_carrot_market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dao.TownWishListDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownWishList;

@Service
public class TownWishListServiceImpl implements TownWishListService{
	@Autowired
	@Qualifier("townWishListDaoImpl")
	private TownWishListDao townWishListDao;
	
	public TownWishListServiceImpl() {
		System.out.println(">>> townWishListDaoImpl : 기본 생성자 호출");
	}

	@Override
	public int selectTownWishListCount(String user_id) throws Exception {
		return townWishListDao.selectTownWishListCount(user_id);
	}

	@Override
	public List<TownWishList> selectTownWishListAll(String user_id) throws Exception {
		return townWishListDao.selectTownWishListAll(user_id);
	}

	@Override
	public TownWishList selectTownWishListOne(int t_wl_no) throws Exception {
		return townWishListDao.selectTownWishListOne(t_wl_no);
	}

	@Override
	public int insertTownWishList(TownWishList townWishList) throws Exception {
		return townWishListDao.insertTownWishList(townWishList);
	}

	@Override
	public int deleteTownWishList(int t_wl_no) throws Exception {
		return townWishListDao.deleteTownWishList(t_wl_no);
	}

	//관심 글 존재 확인
	@Override
	public int selectTownWishExist(String user_id, int t_no) throws Exception {
		return townWishListDao.selectTownWishExist(user_id, t_no);
	}
	
	
	
	
	
}
