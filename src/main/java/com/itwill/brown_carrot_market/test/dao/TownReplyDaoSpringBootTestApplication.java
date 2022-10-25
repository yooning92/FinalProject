package com.itwill.brown_carrot_market.test.dao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dao.TownReplyDao;
import com.itwill.brown_carrot_market.dao.TownWishListDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.TownReply;
import com.itwill.brown_carrot_market.dto.TownWishList;
import com.itwill.brown_carrot_market.dto.UserInfo;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownReplyDaoSpringBootTestApplication {

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
				new SpringApplication(TownReplyDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownReplyDao townReplyDao=(TownReplyDao)context.getBean(TownReplyDao.class);
		
		//System.out.println("insertTownBoardReply() test:"+townReplyDao.insertTownBoardReply(new TownReply(0, "groupno 수정 new 댓글제목", "new 댓글 내용", null, 1, 1, 1, new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), new TownBoard(3, null, null, null, 0, null, null, 0, 0, null, null, null))));
		
		//System.out.println("deleteTownBoardReply() test:"+townReplyDao.deleteTownBoardReply(5));
		
		//System.out.println("updateTownBoardReply() test:"+townReplyDao.updateTownBoardReply(new TownReply(6, "댓글 제목 수정", "댓글 내용 수정", null, 0, 0, 0, null, null)));
		
		

	}
}

	
	

