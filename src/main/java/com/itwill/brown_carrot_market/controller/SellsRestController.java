package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.service.ProductService;

@RestController
public class SellsRestController {
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/sell_list_rest")
	public Map<String, Object> sell_list_rest(@RequestParam(required = false, defaultValue = "0") int p_sell,
											 HttpSession session)throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		String sUserId = (String)session.getAttribute("sUserId");
		
		try {
				List<Product> productList =null;
				if(p_sell == 0) {
					productList = productService.selectByUserId(sUserId);
					resultMap.put("errorCode", 1); 
					resultMap.put("errorMsg", "전체보기 성공");
					resultMap.put("data", productList);
					
				}else {
					productList = productService.selectByUserIdPSell(sUserId, p_sell);
					resultMap.put("errorCode", 2); 
					resultMap.put("errorMsg", "p_sell조건 성공");
					resultMap.put("data", productList);
				}
			
			
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		return resultMap;
	}
}
