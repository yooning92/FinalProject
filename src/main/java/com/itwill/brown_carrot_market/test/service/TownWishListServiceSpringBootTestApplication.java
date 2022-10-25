package com.itwill.brown_carrot_market.test.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.TownBoardService;
import com.itwill.brown_carrot_market.service.TownWishListService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownWishListServiceSpringBootTestApplication {

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
				new SpringApplication(TownWishListServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownWishListService townWishListService=(TownWishListService)context.getBean(TownWishListService.class);
		
		System.out.println("selectTownWishListCount() test:"+townWishListService.selectTownWishListCount("carrot3"));
		
		System.out.println("selectTownWishListAll() test:"+townWishListService.selectTownWishListAll("carrot3"));
		
		System.out.println("selectTownWishListOne() test:"+townWishListService.selectTownWishListOne(1));
		
		System.out.println("insertTownWishList() test:"+townWishListService.insertTownWishList(new TownWishList(0, new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), new TownBoard(2, null, null, null, 0, null, null, 0, 0, null, null, null))));
		
		System.out.println("deleteTownWishList() test:"+townWishListService.deleteTownWishList(11));

	}
}

	
	

