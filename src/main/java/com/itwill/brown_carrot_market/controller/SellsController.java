package com.itwill.brown_carrot_market.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.service.OrdersService;
import com.itwill.brown_carrot_market.service.ProductService;

@Controller
public class SellsController {
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrdersService ordersService;
	
	@LoginCheck
	@RequestMapping(value= "/sell_list")
	public String sell_list(@RequestParam(required = false, defaultValue = "0") int p_sell,Model model,HttpSession session)throws Exception{
		String forwardPath = "";
		String sUserId=(String)session.getAttribute("sUserId");
		if(sUserId == null || sUserId.equals("")) {
			return "user_login";
		}else {
			if(p_sell == 0) {
				List<Product> productList = productService.selectByUserId(sUserId);
				model.addAttribute("productList",productList);
			}else {
				List<Product> productList = productService.selectByUserIdPSell(sUserId, p_sell);
				model.addAttribute("productList",productList);
			}

			forwardPath="sell_list";
			return forwardPath;
		}		
	}
}
