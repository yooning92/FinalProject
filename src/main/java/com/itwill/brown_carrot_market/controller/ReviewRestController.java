package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.Review;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.OrdersService;
import com.itwill.brown_carrot_market.service.ReviewService;

@RestController
public class ReviewRestController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private OrdersService ordersService;
	
	@RequestMapping("review_view_json")
	public Map review_view_json(int review_no,HttpServletRequest request) throws Exception{
		System.out.println("review_view_json >>> review_no :"+review_no);
		Map resultMap=new HashMap();
		int code=1;
		String url="review_view_json";
		String msg="review_view_json 실패";
		
		//String sUserId=(String)request.getSession().getAttribute("sUserId");
		Review review=
		reviewService.findReviewByRivewNo(review_no);
		
		System.out.println("result :"+review);

		if(review!=null) {
			code=2;
			msg="review_view_json 성공";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",review);
		return resultMap;
	}
	
	@RequestMapping("user_received_reviewList_json")
	public Map received_reviewList_json(HttpServletRequest request) throws Exception{
		System.out.println("user_received_reviewList_json");
		Map resultMap=new HashMap();
		int code=1;
		String url="user_received_reviewList_json";
		String msg="user_received_reviewList_json 실패";
		
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		List<Review> reviewList=
		reviewService.findReceivedReview(sUserId);
		code=2;
		msg="user_received_reviewList_json 성공";

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",reviewList);
		return resultMap;
	}
	
	@RequestMapping("isExisted_review_check_json")
	public Map isExisted_review_check_json(@RequestParam(value="orders_no")String orders_no,HttpServletRequest request) throws Exception{
		
		System.out.println("isExisted_review_check_json-orders_no: "+orders_no);
		int ordersNo=Integer.parseInt(orders_no);
		
		Map resultMap=new HashMap();
		int code=1;
		String url="";
		String msg="review 없음";
		
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		Review review = new Review();
		review.setOrders(new Orders(ordersNo, null, null, null, null, null));
		review.setUserInfo(new UserInfo(sUserId, sUserId, sUserId, url, msg, ordersNo, code, sUserId, null));
		Review result = reviewService.isExistedReviewByOrdersNoId(review);
		if(result!=null) {
			code=2;
			msg="review 존재";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",result);
		return resultMap;
	}
	@RequestMapping("isExisted_orders_check_json")
	public Map isExisted_orders_check_json(@RequestParam(value="p_no")String p_no,HttpServletRequest request) throws Exception{
		
		System.out.println("isExisted_orders_check_json-p_no: "+p_no);
		int pNo=Integer.parseInt(p_no);
		
		Map resultMap=new HashMap();
		int code=1;
		String url="";
		String msg="orders 없음";
		
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		
		/*
		Review review = new Review();
		review.setOrders(new Orders(ordersNo, null, null, null, null, null));
		review.setUserInfo(new UserInfo(sUserId, sUserId, sUserId, url, msg, ordersNo, code, sUserId, null));
		Review result = reviewService.isExistedReviewByOrdersNoId(review);
		*/
		Orders orders = ordersService.selectByP_No(pNo);
		System.out.println("orders 존재 "+orders);
		
		if(orders != null) {
			code=2;
			msg="orders 존재";
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",orders);
		return resultMap;
	}
}
