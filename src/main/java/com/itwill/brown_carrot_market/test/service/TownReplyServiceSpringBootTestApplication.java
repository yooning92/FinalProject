package com.itwill.brown_carrot_market.test.service;

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
import com.itwill.brown_carrot_market.service.TownBoardService;
import com.itwill.brown_carrot_market.service.TownReplyService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownReplyServiceSpringBootTestApplication {

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
				new SpringApplication(TownReplyServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownReplyService townReplyService=(TownReplyService)context.getBean(TownReplyService.class);
		
		System.out.println("insertTownBoardReply() test:"+townReplyService.insertTownBoardReply(new TownReply(0, "new service 댓글제목", "new service댓글 내용", null, 1, 1, 1, new UserInfo("carrot1", null, null, null, null, 0, 0, null, null), new TownBoard(1, null, null, null, 0, null, null, 0, 0, null, null, null))));
		
		System.out.println("deleteTownBoardReply() test:"+townReplyService.deleteTownBoardReply(7));
		
		System.out.println("updateTownBoardReply() test:"+townReplyService.updateTownBoardReply(new TownReply(6, "댓글 제목 수정", "댓글 내용 수정", null, 0, 0, 0, null, null)));
		
		

	}
}

	
	

