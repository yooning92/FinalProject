package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.mapper.OrdersMapper;

@Repository(value = "ordersDaoImpl")
public class OrdersDaoImpl implements OrdersDao{
	@Autowired(required = true)
	private OrdersMapper ordersMapper;
	
	public OrdersDaoImpl() {
		System.out.println("#### OrdersDaoImplMyBatisMapperInterface() : 디폴트생성자 호출  ");
	}
	
	public OrdersMapper getOrdersMapper() {
		return ordersMapper;
	}

	public void setOrdersMapper(OrdersMapper ordersMapper) {
		this.ordersMapper = ordersMapper;
	}

	@Override
	public int insertOrders(Orders orders) throws Exception {
		System.out.println("#### OrdersDaoImplMyBatisMapperInterface : insertOrders() 호출  ");
		System.out.println("insertOrders()메소드 : " + ordersMapper);
		return ordersMapper.insertOrders(orders);
	}

	@Override
	public int deleteOrders(int orders_no) throws Exception {
		System.out.println("#### OrdersDaoImplMyBatisMapperInterface : deleteOrders(int orders_no) 호출  ");
		System.out.println("deleteOrders(int orders_no) 메소드 : " + ordersMapper);
		return ordersMapper.deleteOrders(orders_no);
	}

	@Override
	public Orders selectByNo(int orders_no) throws Exception {
		System.out.println("#### OrdersDaoImplMyBatisMapperInterface : selectByNo(int orders_no) 호출  ");
		System.out.println("selectByNo(int orders_no) 메소드 : " + ordersMapper);
		return ordersMapper.selectByNo(orders_no);
	}

	@Override
	public List<Orders> selectAllById(String user_id) throws Exception {
		System.out.println("#### OrdersDaoImplMyBatisMapperInterface : selectAllById(String user_id) 호출  ");
		System.out.println("selectAllById(String user_id) 메소드 : " + ordersMapper);
		return ordersMapper.selectAllById(user_id);
	}

	@Override
	public int selectByOrdersCount(int p_no) throws Exception {
		System.out.println("#### OrdersDaoImplMyBatisMapperInterface : selectByOrdersCount(int p_no) 호출  ");
		System.out.println("selectByOrdersCount(int p_no) 메소드 : " + ordersMapper);
		return ordersMapper.selectByOrdersCount(p_no);
	}

	@Override
	public Orders selectByP_No(int p_no) {
		return ordersMapper.selectByP_No(p_no);
	}

}
