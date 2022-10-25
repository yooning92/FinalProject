package com.itwill.brown_carrot_market.test.dao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dao.TownReactionDao;
import com.itwill.brown_carrot_market.dao.TownReplyDao;
import com.itwill.brown_carrot_market.dao.TownWishListDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.TownReaction;
import com.itwill.brown_carrot_market.dto.TownReply;
import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.dto.UserInfo;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownReactionDaoSpringBootTestApplication {

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
				new SpringApplication(TownReactionDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownReactionDao townReactionDao=(TownReactionDao)context.getBean(TownReactionDao.class);
		
		
		//System.out.println("insertTownBoardReac() test:"+townReactionDao.insertTownBoardReac(new TownReaction(0, 3, new TownBoard(1, null, null, null, 0, null, null, 0, 0, null, null, null), new UserInfo("carrot1", null, null, null, null, 0, 0, null, null))));
		
		System.out.println("deleteTownBoardReac() test:"+townReactionDao.deleteTownBoardReac(42));
		
		System.out.println("selectTownBoardReacCount() test:"+townReactionDao.selectTownBoardReacCount(1));
		
		System.out.println("selectTownBoardReacTypeCount() test:"+townReactionDao.selectTownBoardReacTypeCount(1, 1));
		

	}
}

	
	

