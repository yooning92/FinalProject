package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.OrdersService;

@RestController
public class OrdersRestController {
	@Autowired
	private OrdersService ordersService;
	
	@GetMapping("/orders_list_json")
	public Map orders_list_json(HttpServletRequest request, Orders orders) throws Exception{
		Map resultMap = new HashMap();
		int code=1;
		String url = "main";
		String msg = "";
		String sUserId=(String)request.getSession().getAttribute("sUserId");

		List<Orders> ordersList = ordersService.selectAllById(sUserId);
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg",msg);
		resultMap.put("data", ordersList);
		return resultMap;
	}
	
	@RequestMapping("/orders_insert_json")
	public Map orders_insert_json(int p_no, String yourId,String user_id, HttpServletRequest request) throws Exception{
		System.out.println("orders_insert_json - p_no :"+p_no);
		//System.out.println("orders_insert_json - product :"+product);
		System.out.println("orders_insert_json - yourId :"+yourId);
		System.out.println("orders_insert_json - sellerId :"+user_id);
		
		Map resultMap = new HashMap();
		int code=0;
		String url = "main";
		String msg = "orders_insert_json 실패";
		String msg2 = "";
		String sUserId = (String)request.getSession().getAttribute("sUserId");
		System.out.println("orders_insert_json - sUserId: "+sUserId);
		
		Orders orders = new Orders();
		if(sUserId.equals(user_id)) {// 내가 판매자라면
			orders.setUserinfo(new UserInfo(yourId, null, null, null, null, 0, 0, null, null));
			msg2="판매자가 주문상태변경";
		}else {//내가 구매자라면(나중에 유입안되도록 막을 예정)
			orders.setUserinfo(new UserInfo(sUserId, null, null, null, null, 0, 0, null, null));
			msg2="구매자가 주문상태변경";
		}
		
		orders.setProduct(new Product(p_no, msg, msg, code, url, code, code, code, msg, p_no, code, null, null, null, null));
		//orders.setProduct(product);
		int result = ordersService.insertOrders(orders);
		if(result>0) {
			msg="orders_insert_json 성공";
		}
		
		resultMap.put("code", code);
		resultMap.put("url", url);		
		resultMap.put("msg",msg);
		resultMap.put("msg2",msg2);
		resultMap.put("data", result);
		return resultMap;
	}
	
	
}
