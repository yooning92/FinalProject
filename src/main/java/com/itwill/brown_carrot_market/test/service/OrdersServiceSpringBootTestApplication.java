package com.itwill.brown_carrot_market.test.service;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.Transfer;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.OrdersService;


@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"})
public class OrdersServiceSpringBootTestApplication {
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
				new SpringApplication(OrdersServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		OrdersService ordersService = (OrdersService)context.getBean(OrdersService.class);
		//System.out.println(ordersService.deleteOrders(21));
		System.out.println(ordersService.selectByNo(15));
		System.out.println(ordersService.selectAllById("carrot5"));
		//System.out.println(ordersService.insertOrders(new Orders(0,new Product(9,null,null,0,null,0,0,0,null,0,0,null,null,null,null),new UserInfo("carrot1", null, null, null, null, 0, 0, null, null), new Transfer(),null, new ProductImage())));

	}
}