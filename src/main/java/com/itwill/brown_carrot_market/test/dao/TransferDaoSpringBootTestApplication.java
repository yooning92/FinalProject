package com.itwill.brown_carrot_market.test.dao;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.TransferDao;
import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.Transfer;


@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"})
public class TransferDaoSpringBootTestApplication {
	public static void main(String[] args) throws Exception {
		/****************case1********************/
		/*
		 * application.properties에 설정추가
		 *    spring.main.web-application-type=none
		 */
		/*
		ConfigurableApplicationContext context = 
				SpringApplication.run(GuestDaoSpringBootTestApplication.class, args);
		GuestDao guestDao = (GuestDao) context.getBean(GuestDao.class);
		System.out.println(guestDao.selectAll());
		System.out.println(guestDao.selectByNo(881));
		*/
		
		SpringApplication application = 
				new SpringApplication(TransferDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TransferDao transferDao=(TransferDao)context.getBean(TransferDao.class);
//		System.out.println(transferDao.insertTransfer_Deposit(9));
//		System.out.println(transferDao.insertTransfer_Withdraw(9));
//		System.out.println(transferDao.insertTransfer_Withdraw_Cancle(7));
//		System.out.println(transferDao.insertTransfer_Deposit_Cancle(7));
//		System.out.println(transferDao.selectById("carrot1"));
		
	}

}