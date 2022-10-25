package com.itwill.brown_carrot_market.test.dao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.WishListDao;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.dto.WishList;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class WishListDaoSpringBootTestApplication {
	
	public static void main(String[] args) throws Exception{
		SpringApplication application = 
				new SpringApplication(WishListDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		WishListDao wishListDao=(WishListDao)context.getBean(WishListDao .class);
		
		//System.out.println(wishListDao.selectWishListAll("carrot1"));
		//System.out.println(wishListDao.selectWishListOne(1));
		//System.out.println(wishListDao.selectWishListCount("carrot1"));
		//System.out.println(wishListDao.insertWishList(new WishList(0,new Product(5, null, null, 0, null, 0, 0, 0, null, 0, 0, null, null, null, null) ,new UserInfo("carrot3", null, null, null, null, 0, 0, null, null))));
		//System.out.println(wishListDao.deleteWishList(15));
	}
}
