package com.itwill.brown_carrot_market.test.service;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.service.TransferService;


@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"})
public class TransferServiceSpringBootTestApplication {
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
				new SpringApplication(TransferServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TransferService transferService=(TransferService)context.getBean(TransferService.class);
		
//		transferService.transfer_transaction(2);
//		transferService.transfer_cancel_transaction(2);
//		System.out.println(transferService.insert_Point_Deposit(1000, "carrot8"));
//		System.out.println(transferService.update_Point_By_Id("carrot8"));
		
//		System.out.println(transferService.insertTransfer_Deposit(8));
//		System.out.println(transferService.insertTransfer_Withdraw(8));
//		System.out.println(transferService.insertTransfer_Withdraw_Cancle(8));
//		System.out.println(transferService.insertTransfer_Deposit_Cancle(8));
//		System.out.println(transferService.selectById("carrot8"));
//		System.out.println(transferService.selectByP_Id("carrot8"));

	}

}