package com.itwill.brown_carrot_market.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.service.OrdersService;
import com.itwill.brown_carrot_market.service.ReviewService;


@Controller
public class OrdersController {
	@Autowired
	private OrdersService ordersService;
	
	@LoginCheck
	@RequestMapping(value = "/orders_list")
	public String orders_list(Model model, HttpServletRequest request) throws Exception{
		String forwardPath="";
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		request.getSession().setAttribute("sUserId", sUserId);
		if(sUserId==null || sUserId.equals("")) {
			return "user_login";
		}else {
		List<Orders> ordersList=ordersService.selectAllById(sUserId);
		model.addAttribute("ordersList", ordersList);
		forwardPath="orders_list";
		return forwardPath;
		}
	}
}