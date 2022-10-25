package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.service.TownWishListService;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@Controller
public class TownWishListController {
	@Autowired
	private TownWishListService townWishListService;
	/*
	@RequestMapping("/townWishlist")
	public String townWishList_List(HttpSession session ,@RequestParam Integer t_no,@ModelAttribute TownBoard townBoard) throws Exception {
		String sUserId = (String)session.getAttribute("sUserId");
		
		
		List<TownWishList> townWishLists = townWishListService.selectTownWishListAll(sUserId);
		
		
		
		
		return null;
	}
	*/
	
	
	
	
}
