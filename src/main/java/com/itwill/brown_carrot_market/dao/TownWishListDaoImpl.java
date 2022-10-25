package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.mapper.TownWishListMapper;

@Repository(value = "townWishListDaoImpl")
public class TownWishListDaoImpl implements TownWishListDao{
	@Autowired(required = true)
	private TownWishListMapper townWishListMapper;
	
	public TownWishListDaoImpl() {
		System.out.println(">>> TownWishListDaoImpl 호출");
	}
	
	public TownWishListMapper getTownWishListMapper() {
		return townWishListMapper;
	}
	public void setTownWishListMapper(TownWishListMapper townWishListMapper) {
		System.out.println(">>> townWishListDaoImpl : setTownWishListMapper 호출");
		this.townWishListMapper = townWishListMapper;
	}
	
	@Override
	public int selectTownWishListCount(String user_id) throws Exception{
		System.out.println(">>> townWishListDaoImpl : selectTownWishListCount()호출");
		return townWishListMapper.selectTownWishListCount(user_id);
	}


	@Override
	public List<TownWishList> selectTownWishListAll(String user_id) throws Exception{
		System.out.println(">>> townWishListDaoImpl : selectTownWishListAll() 호출");
		return townWishListMapper.selectTownWishListAll(user_id);
	}

	@Override
	public TownWishList selectTownWishListOne(int t_wl_no) throws Exception{
		System.out.println(">>> townWishListDaoImpl : selectTownWishListOne() 호출");
		return townWishListMapper.selectTownWishListOne(t_wl_no);
	}

	@Override
	public int insertTownWishList(TownWishList townWishList) throws Exception{
		System.out.println(">>> townWishListDaoImpl : insertTownWishList() 호출");
		return townWishListMapper.insertTownWishList(townWishList);
	}

	@Override
	public int deleteTownWishList(int t_wl_no) throws Exception{
		System.out.println(">>> townWishListDaoImpl : deleteTownWishList() 호출");
		return townWishListMapper.deleteTownWishList(t_wl_no);
	}

	//관심 글 존재 확인
	@Override
	public int selectTownWishExist(String user_id, int t_no) throws Exception {
		System.out.println(">>> townWishListDaoImpl : selectTownWishExist(String user_id, int t_no) 호출");
		return townWishListMapper.selectTownWishExist(user_id, t_no);
	}
	

}
