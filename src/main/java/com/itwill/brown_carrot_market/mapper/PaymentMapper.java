package com.itwill.brown_carrot_market.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwill.brown_carrot_market.dto.Payment;
@Mapper
public interface PaymentMapper {
	
	int insertPayment_Deposit(Payment payment);
	
	int insertPayment_Withdraw(Payment payment);
	
	List<Payment> selectPaymentById(String user_id);
}
