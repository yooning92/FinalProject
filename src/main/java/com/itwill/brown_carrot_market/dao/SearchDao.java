package com.itwill.brown_carrot_market.dao;

import java.util.List;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.TownBoard;

public interface SearchDao {
	public List<Product> selectListSearch(String search_keyword, Address address,int pageStart,int pageEnd);
	
	public int selectListSearchCount(String search_keyword, Address address);
	
	public List<Product> selectListNotLogin(String search_keyword,int pageStart,int pageEnd);
	
	public int selectListNotLoginCount(String search_keyword);
	
	//townboard
	
		public List<TownBoard> searchTownBoardListNotLogin(String search_keyword,int pageStart,int pageEnd);
		
		public int searchTownBoardListNotLoginCount(String search_keyword);
		
		public List<TownBoard> searchTownBoardList(String search_keyword, Address address,int pageStart,int pageEnd );
		
		public int searchTownBoardListCount(String search_keyword, Address address);
		

}
