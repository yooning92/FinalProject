package com.itwill.brown_carrot_market.test.dao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.PaymentDao;
import com.itwill.brown_carrot_market.dto.Payment;
import com.itwill.brown_carrot_market.dto.UserInfo;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"})
public class PaymentDaoSpringBootTestApplication {
	public static void main(String[] args) throws Exception {
	SpringApplication application = 
			new SpringApplication(PaymentDaoSpringBootTestApplication.class);
	application.setWebApplicationType(WebApplicationType.NONE);
	ConfigurableApplicationContext context=application.run(args);
	PaymentDao paymentDao=(PaymentDao)context.getBean(PaymentDao.class);
//	System.out.println(paymentDao.insertPayment_Deposit(new Payment("test-code2", "test-card", 50000, null, new UserInfo("carrot8", null, null, null,null,0,0,null,null))));
//	System.out.print(paymentDao.insertPayment_Withdraw(new Payment("test-code2", "test-card", 50000, null, new UserInfo("carrot8", null, null, null,null,0,0,null,null))));
//	System.out.println(paymentDao.selectPaymentById("carrot8"));
	}
}
