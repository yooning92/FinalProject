package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.Orders;

@Mapper
public interface OrdersMapper {
	
	List<Orders> selectAllById(String user_id); 

	Orders selectByNo(int orders_no);

	int selectByOrdersCount(int p_no);
	
	Orders selectByP_No(int p_no);
	
	int insertOrders(Orders orders);
	
	int deleteOrders(int orders_no);


}
