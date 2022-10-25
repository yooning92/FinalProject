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

import com.itwill.brown_carrot_market.dto.WishList;
import com.itwill.brown_carrot_market.service.WishListService;

@Controller
public class WishListController {
	
	@Autowired
	WishListService wishListService;
	
	
	@RequestMapping(value="/wishList",method=RequestMethod.GET)
	public String wishList(HttpServletRequest req, Model model, HttpSession session) {
		String sUserId = (String)session.getAttribute("sUserId");
		try {
		List<WishList> wishList=wishListService.selectWishListAll(sUserId);
		System.out.println(wishList);
		model.addAttribute("wishList", wishList);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "wishList";
	}
	
	

}
