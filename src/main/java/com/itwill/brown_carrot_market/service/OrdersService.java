package com.itwill.brown_carrot_market.service;

import java.util.List;

import com.itwill.brown_carrot_market.dto.Orders;

public interface OrdersService {
	int insertOrders(Orders orders) throws Exception;
	
	int deleteOrders(int orders_no) throws Exception;
	
	Orders selectByNo(int orders_no) throws Exception;
	
	List<Orders> selectAllById(String user_id) throws Exception; 
	
	int selectByOrdersCount(int p_no) throws Exception;
	
	Orders selectByP_No(int p_no) throws Exception;
}
