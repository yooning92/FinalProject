package com.itwill.brown_carrot_market.test.dao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dao.TownWishListDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.dto.UserInfo;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownWishListDaoSpringBootTestApplication {

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
				new SpringApplication(TownWishListDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownWishListDao townWishListDao=(TownWishListDao)context.getBean(TownWishListDao.class);
		
		System.out.println("selectTownWishListCount() test:"+townWishListDao.selectTownWishListCount("carrot3"));
		
		System.out.println("selectTownWishListAll() test:"+townWishListDao.selectTownWishListAll("carrot3"));
		
		System.out.println("selectTownWishListOne() test:"+townWishListDao.selectTownWishListOne(1));
		
		//System.out.println("insertTownWishList() test:"+townWishListDao.insertTownWishList(new TownWishList(0, new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), new TownBoard(2, null, null, null, 0, null, null, 0, 0, null, null, null))));
		
		System.out.println("deleteTownWishList() test:"+townWishListDao.deleteTownWishList(10));
		
		

	}
}

	
	

