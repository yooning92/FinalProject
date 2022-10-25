package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.dto.WishList;
import com.itwill.brown_carrot_market.service.WishListService;

@RestController
public class WishListRestController {
	@Autowired
 WishListService wishListService;
	
	@RequestMapping("/checkWish")
	public Map<String,Object> checkWish(@RequestParam int p_no,HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		String user_id=(String)session.getAttribute("sUserId");
		int result=0;
		try {
			if(user_id == null || user_id.equals("")) {
				System.out.println("로그인 안돼서 작동안해용");
			}else {
			result=wishListService.checkWish(p_no, user_id);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		resultMap.put("data",result);
		
		return resultMap;
	}
	
	@RequestMapping("/wishDelete")
	public Map<String,Object> wishDelete(@RequestParam int w_no,HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		String user_id=(String)session.getAttribute("sUserId");
		int result=0;
		try {
			result=wishListService.deleteWishList(w_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		resultMap.put("data",result);
		return resultMap;
	}
	
	
	@RequestMapping("/wishDeletePD")
	public Map<String,Object> wishDeletePd(@RequestParam int p_no,HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		String user_id=(String)session.getAttribute("sUserId");
		
		int result=0;
		try {
			result=wishListService.deleteWishPD(p_no, user_id);
		}catch (Exception e) {
			e.printStackTrace();
		}
		resultMap.put("data",result);
		return resultMap;
	}
	
	@RequestMapping("/wishInsert")
	public Map<String,Object> wishInsert(@RequestParam int p_no,HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		String user_id=(String)session.getAttribute("sUserId");
		
		int result=0;
		
		WishList wish=new WishList(0, new Product(p_no, null, null, 0, null,0, 0, 0, null, 0, 0, null, null, null, null), 
				new UserInfo(user_id, null, null, null, null, 0, 0, null, null));
		
		try {
			result=wishListService.insertWishList(wish);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		resultMap.put("data",result);
		return resultMap;
		
	}
	

}
