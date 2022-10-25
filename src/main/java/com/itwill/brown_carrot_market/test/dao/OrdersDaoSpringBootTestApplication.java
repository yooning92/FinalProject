package com.itwill.brown_carrot_market.test.dao;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.OrdersDao;
import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.Transfer;
import com.itwill.brown_carrot_market.dto.UserInfo;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill"})
public class OrdersDaoSpringBootTestApplication {
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
				new SpringApplication(OrdersDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		OrdersDao ordersDao=(OrdersDao)context.getBean(OrdersDao.class);
		//System.out.println(ordersDao.deleteOrders(1));
		//System.out.println(ordersDao.selectByNo(2));
		//System.out.println(ordersDao.selectAllById("carrot8"));
		//System.out.println(ordersDao.insertOrders(new Orders(0,new Product(7,null,null,0,null,0,0,0,null,0,0,null,null,null,null),"carrot2",new Transfer(0, 0, 0, null, null, new Orders(), new Product(),new UserInfo()))));

	}
}