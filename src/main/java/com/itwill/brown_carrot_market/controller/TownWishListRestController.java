package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.service.TownWishListService;
import com.itwill.brown_carrot_market.util.PageMakerDto;
/*
@RestController
public class TownWishListRestController {
	
	@Autowired
	private TownWishListService townWishListService;
	
	@RequestMapping("/townWishlist")
	public Map townWishlist(HttpSession session ,@RequestParam Integer t_no,@ModelAttribute TownBoard townBoard) throws Exception {
		String sUserId = (String)session.getAttribute("sUserId");
		Map resultMap = new HashMap();
		try {
		List<TownWishList> townWishLists = townWishListService.selectTownWishListAll(sUserId);
		resultMap.put("errorCode", 1); 
		resultMap.put("errorMsg", "성공");
		resultMap.put("data", townWishLists);
	} catch (Exception e) {
		e.printStackTrace();
		resultMap.put("errorCode", -1);
		resultMap.put("errorMsg", "관리자에게 문의하세요");
	}
		return resultMap;
	}

	

}
*/	