package com.itwill.brown_carrot_market.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.OrdersDao;
import com.itwill.brown_carrot_market.dto.Orders;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired
	@Qualifier("ordersDaoImpl")
	private OrdersDao ordersDao;

	public OrdersServiceImpl() {
		System.out.println("#### OrdersServiceImpl() : 디폴트생성자 호출  ");
	}

	@Override
	public int insertOrders(Orders orders) throws Exception {
		return ordersDao.insertOrders(orders);
	}

	@Override
	public int deleteOrders(int orders_no) throws Exception {
		return ordersDao.deleteOrders(orders_no);
	}

	@Override
	public Orders selectByNo(int orders_no) throws Exception {
		return ordersDao.selectByNo(orders_no);
	}

	@Override
	public List<Orders> selectAllById(String user_id) throws Exception {
		return ordersDao.selectAllById(user_id);
	}

	@Override
	public int selectByOrdersCount(int p_no) throws Exception {
		return ordersDao.selectByOrdersCount(p_no);
	}

	@Override
	public Orders selectByP_No(int p_no) throws Exception {
		return ordersDao.selectByP_No(p_no);
	}
	
}
