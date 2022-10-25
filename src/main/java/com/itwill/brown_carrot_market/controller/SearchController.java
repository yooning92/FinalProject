package com.itwill.brown_carrot_market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.service.SearchService;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@Controller
public class SearchController {
@Autowired
SearchService searchService;

@RequestMapping(value="/search_list",method=RequestMethod.GET)
public String searchKeyword(@RequestParam(required = false, defaultValue = "1") Integer pageno,HttpServletRequest req, Model model, HttpSession session){
	String keyWord=req.getParameter("search_keyword");
	Address sAddress=(Address)session.getAttribute("sAddress");
	PageMakerDto<Product> searchList=null;
	System.out.println("검색 키워드:"+keyWord);
	if(sAddress!=null) {
		searchList=(PageMakerDto<Product>)searchService.selectListSearch(keyWord, sAddress, pageno);
		model.addAttribute("searchList", searchList);
		model.addAttribute("pageno", pageno);
		System.out.println("로그인검색목록"+searchList);
	}else {
		 searchList = (PageMakerDto<Product>) searchService.selectListNotLogin(keyWord,pageno);
		
		model.addAttribute("searchList",searchList);
		model.addAttribute("pageno", pageno);
		System.out.println("검색목록"+searchList);
	}
return "search_list";	
}

@RequestMapping(value="/townBoardSearch_list",method=RequestMethod.GET)
public String searchTownBoard(@RequestParam(required = false, defaultValue = "1") Integer pageno,HttpServletRequest req, Model model, HttpSession session) {
	String keyWord=req.getParameter("search_keyword");
	Address sAddress=(Address)session.getAttribute("sAddress");
	PageMakerDto<TownBoard> searchList=null;
	System.out.println("검색 키워드:"+keyWord);
	
	if(sAddress!=null) {
		searchList=(PageMakerDto<TownBoard>)searchService.searchTownBoardList(keyWord, sAddress, pageno);
		model.addAttribute("searchList",searchList);
		model.addAttribute("pageno", pageno);
		System.out.println("검색목록"+searchList);
		
	}else {
		searchList=(PageMakerDto<TownBoard>) searchService.searchTownBoardListNotLogin(keyWord, pageno);
		model.addAttribute("searchList",searchList);
		model.addAttribute("pageno", pageno);
		System.out.println("검색목록"+searchList);
		
	}
	
	return "townBoardSearch_list";
}

	
}
