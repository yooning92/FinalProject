package com.itwill.brown_carrot_market.test.service;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.NoticeService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class NoticeServiceSpringBootTestApplication {

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
				new SpringApplication(NoticeServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		NoticeService noticeService=(NoticeService)context.getBean(NoticeService.class);
		
		//System.out.println("selectAll() test:"+noticeService.selectAll());
		
		System.out.println("selectByNo() test:"+noticeService.selectByNo(2));
		
		//System.out.println("insertNotice() test:"+noticeService.insertNotice(new Notice(0, "추가 service 공지사항 제목", "추가 service 공지사항 내용", null, 0, 0)));
		
		System.out.println("deleteNotice() test:"+noticeService.deleteNotice(12));
		
		System.out.println("updateNotice() test:"+noticeService.updateNotice(new Notice(13, "공지사항 service 제목 수정", "공지사항service 내용 수정", null, 0, 1)));
		
		System.out.println("updateNoticeCount() test:"+noticeService.updateNoticeCount(2));
		
		

	}
}

	
	

