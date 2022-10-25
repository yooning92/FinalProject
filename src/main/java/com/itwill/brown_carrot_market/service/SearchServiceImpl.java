package com.itwill.brown_carrot_market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.SearchDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.util.PageMaker;
import com.itwill.brown_carrot_market.util.PageMakerDto;
@Service
public class SearchServiceImpl implements SearchService {
	@Autowired
	SearchDao searchDao;


	

	@Override
	public int selectListNotLoginCount(String search_keyword) {
		// TODO Auto-generated method stub
		return searchDao.selectListNotLoginCount(search_keyword);
	}



	@Override
	public PageMakerDto<Product> selectListNotLogin(String search_keyword, int currentPage) {
		// TODO Auto-generated method stub
		int totalCount=searchDao.selectListNotLoginCount(search_keyword);
		PageMaker pageMaker=new PageMaker(totalCount,currentPage,5,5);
		List<Product> searchList=searchDao.selectListNotLogin(search_keyword, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<Product> pageMakerSearchList=new PageMakerDto<Product>(searchList, pageMaker, totalCount);
		
		return pageMakerSearchList;
	}



	@Override
	public PageMakerDto<Product> selectListSearch(String search_keyword, Address address, int currentPage) {
		int totalCount=searchDao.selectListSearchCount(search_keyword, address);
		PageMaker pageMaker=new PageMaker(totalCount, currentPage, 5, 5);
		List<Product> searchList=searchDao.selectListSearch(search_keyword, address, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<Product> pageMakerSearchList=new PageMakerDto<Product>(searchList, pageMaker, totalCount);
		return pageMakerSearchList;
	}



	@Override
	public int selectListSearchCount(String search_keyword, Address address) {
		// TODO Auto-generated method stub
		return searchDao.selectListSearchCount(search_keyword, address);
	}



	@Override
	public PageMakerDto<TownBoard> searchTownBoardListNotLogin(String search_keyword, int currentPage) {
		int totalCount=searchDao.searchTownBoardListNotLoginCount(search_keyword);
		PageMaker pageMaker=new PageMaker(totalCount,currentPage,5,5);
		List<TownBoard> searchList=searchDao.searchTownBoardListNotLogin(search_keyword, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<TownBoard> pageMakerSearchList=new PageMakerDto<TownBoard>(searchList, pageMaker, totalCount);
		return pageMakerSearchList;
	}



	@Override
	public int searchTownBoardListNotLoginCount(String search_keyword) {
		// TODO Auto-generated method stub
		return searchDao.searchTownBoardListNotLoginCount(search_keyword);
	}



	@Override
	public PageMakerDto<TownBoard> searchTownBoardList(String search_keyword, Address address, int currentPage) {
		int totalCount=searchDao.searchTownBoardListCount(search_keyword, address);
		PageMaker pageMaker=new PageMaker(totalCount, currentPage,5,5);
		List<TownBoard> searchList=searchDao.searchTownBoardList(search_keyword, address, pageMaker.getPageBegin(), pageMaker.getPageEnd());
		PageMakerDto<TownBoard> pageMakerSearchList=new PageMakerDto<TownBoard>(searchList, pageMaker, totalCount);
		return pageMakerSearchList;
	}



	@Override
	public int searchTownBoardListCount(String search_keyword, Address address) {
		// TODO Auto-generated method stub
		return searchDao.searchTownBoardListCount(search_keyword, address);
	}

}
