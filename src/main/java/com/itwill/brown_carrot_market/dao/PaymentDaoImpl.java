package com.itwill.brown_carrot_market.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.itwill.brown_carrot_market.dto.Payment;
import com.itwill.brown_carrot_market.mapper.PaymentMapper;

@Repository(value = "paymentDaoImpl")
public class PaymentDaoImpl implements PaymentDao{
	@Autowired(required = true)
	private PaymentMapper paymentMapper;
		
	public PaymentDaoImpl() {
		System.out.println("#### PaymentDaoImplMyBatisMapperInterface() : 디폴트생성자 호출  ");
	}
	
	public PaymentMapper getPaymentMapper() {
		return paymentMapper;
	}

	public void setPaymentMapper(PaymentMapper paymentMapper) {
		this.paymentMapper = paymentMapper;
	}

	@Override
	public int insertPayment_Deposit(Payment payment) throws Exception {
		System.out.println("#### PaymentDaoImpl : insertPayment(Payment payment) 호출  ");
		return paymentMapper.insertPayment_Deposit(payment);
	}

	@Override
	public int insertPayment_Withdraw(Payment payment) throws Exception {
		System.out.println("#### PaymentDaoImpl : insertPayment_Withdraw(Payment payment) 호출  ");
		return paymentMapper.insertPayment_Deposit(payment);
	}

	@Override
	public List<Payment> selectPaymentById(String user_id) {
		System.out.println("#### PaymentDaoImpl : selectPaymentById(Payment payment) 호출  ");
		return paymentMapper.selectPaymentById(user_id);
	}

}
