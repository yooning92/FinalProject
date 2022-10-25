package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.mapper.SearchMapper;

@Repository
public class SearchDaoImpl implements SearchDao{
	
	@Autowired
	SearchMapper searchMapper;

	

	@Override
	public List<Product> selectListNotLogin(String search_keyword,int pageStart, int pageEnd) {
		// TODO Auto-generated method stub
		return searchMapper.selectListNotLogin(search_keyword,pageStart, pageEnd);
	}

	@Override
	public int selectListNotLoginCount(String search_keyword) {
		// TODO Auto-generated method stub
		return searchMapper.selectListNotLoginCount(search_keyword);
	}

	@Override
	public List<Product> selectListSearch(String search_keyword, Address address, int pageStart, int pageEnd) {
		// TODO Auto-generated method stub
		return searchMapper.selectListSearch(search_keyword, address, pageStart, pageEnd);
	}

	@Override
	public int selectListSearchCount(String search_keyword, Address address) {
		// TODO Auto-generated method stub
		return searchMapper.selectListSearchCount(search_keyword, address);
	}

	//townBoard
	
	@Override
	public List<TownBoard> searchTownBoardListNotLogin(String search_keyword, int pageStart, int pageEnd) {
		// TODO Auto-generated method stub
		return searchMapper.searchTownBoardListNotLogin(search_keyword, pageStart, pageEnd);
	}

	@Override
	public int searchTownBoardListNotLoginCount(String search_keyword) {
		// TODO Auto-generated method stub
		return searchMapper.searchTownBoardListNotLoginCount(search_keyword);
	}

	@Override
	public List<TownBoard> searchTownBoardList(String search_keyword, Address address, int pageStart, int pageEnd) {
		// TODO Auto-generated method stub
		return searchMapper.searchTownBoardList(search_keyword, address, pageStart, pageEnd);
	}

	@Override
	public int searchTownBoardListCount(String search_keyword, Address address) {
		// TODO Auto-generated method stub
		return searchMapper.searchTownBoardListCount(search_keyword, address);
	}

}
