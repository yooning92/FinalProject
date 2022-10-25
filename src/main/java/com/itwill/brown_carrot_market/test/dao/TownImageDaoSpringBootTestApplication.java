package com.itwill.brown_carrot_market.test.dao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dao.TownImageDao;
import com.itwill.brown_carrot_market.dao.TownReactionDao;
import com.itwill.brown_carrot_market.dao.TownReplyDao;
import com.itwill.brown_carrot_market.dao.TownWishListDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.TownImage;
import com.itwill.brown_carrot_market.dto.TownReaction;
import com.itwill.brown_carrot_market.dto.TownReply;
import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.dto.UserInfo;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownImageDaoSpringBootTestApplication {

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
				new SpringApplication(TownImageDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownImageDao townImageDao=(TownImageDao)context.getBean(TownImageDao.class);
		
		
		
		System.out.println("deleteTownBoardReac() test:"+townImageDao.deleteTownBoardImgAll(1));
		
		System.out.println("deleteTownBoardImgOne() test:"+townImageDao.deleteTownBoardImgOne(6));
		
		//System.out.println("insertTownBoardImg() test:"+townImageDao.insertTownBoardImg(new TownImage(0, "a.jpg", 1)));
		

	}
}

	
	

