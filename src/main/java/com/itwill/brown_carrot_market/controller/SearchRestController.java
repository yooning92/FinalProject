package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.service.SearchService;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@RestController
public class SearchRestController {
	@Autowired
	SearchService searchService;
	
	@RequestMapping("/searchList_rest")
	public Map<String,Object> searchList_rest(@RequestParam(required = false, defaultValue = "1") Integer pageno,@RequestParam String keyword , HttpServletRequest req,HttpSession session){
		
		System.out.println("레스트서치:"+keyword);
		Map<String, Object> resultMap = new HashMap<>();
		PageMakerDto<Product> searchList=null;
		String sUserId = (String)session.getAttribute("sUserId");
		Address sAddress = (Address)session.getAttribute("sAddress");
		if(sAddress!=null) {
			searchList= (PageMakerDto<Product>)searchService.selectListSearch(keyword, sAddress, pageno);
			resultMap.put("data", searchList);
			
			System.out.println("로그인검색목록"+searchList);
		}else {
			 searchList = (PageMakerDto<Product>) searchService.selectListNotLogin(keyword,pageno);
			resultMap.put("data",searchList);
			
			System.out.println("검색목록"+searchList);
		}
		
		return resultMap;
	
	}
	
	
	@RequestMapping("/searchTown_rest")
	public Map<String,Object> searchTownList_rest(@RequestParam(required = false, defaultValue = "1") Integer pageno,@RequestParam String keyword , HttpServletRequest req,HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		PageMakerDto<TownBoard> searchList=null;
		
		Address sAddress = (Address)session.getAttribute("sAddress");
		if(sAddress!=null) {
			searchList=(PageMakerDto<TownBoard>)searchService.searchTownBoardList(keyword, sAddress, pageno);
			resultMap.put("data", searchList);
		}else {
			searchList=(PageMakerDto<TownBoard>)searchService.searchTownBoardListNotLogin(keyword, pageno);
			resultMap.put("data", searchList);
		}
		
		
		return resultMap;
	}

}
