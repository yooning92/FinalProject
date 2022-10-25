package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.TownBoard;
@Mapper
public interface SearchMapper {
	public List<Product> selectListSearch(String search_keyword, Address address,int pageStart,int pageEnd);
	
	public int selectListSearchCount(String search_keyword, Address address);
	
	public List<Product> selectListNotLogin(String search_keyword,int pageStart,int pageEnd);
	
	public int selectListNotLoginCount(String search_keyword);
	
	//townboard 검색
	public List<TownBoard> searchTownBoardListNotLogin(String search_keyword,int pageStart,int pageEnd);
	
	public int searchTownBoardListNotLoginCount(String search_keyword);
	
	public List<TownBoard> searchTownBoardList(String search_keyword, Address address,int pageStart,int pageEnd );
	
	public int searchTownBoardListCount(String search_keyword, Address address);
}
