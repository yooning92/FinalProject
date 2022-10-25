package com.itwill.brown_carrot_market.test.dao;

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

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class NoticeDaoSpringBootTestApplication {

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
				new SpringApplication(NoticeDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		NoticeDao noticeDao=(NoticeDao)context.getBean(NoticeDao.class);
		
		//System.out.println("selectAll() test:"+noticeDao.selectAll());
		
		System.out.println("selectByNo() test:"+noticeDao.selectByNo(2));
		
		//System.out.println("insertNotice() test:"+noticeDao.insertNotice(new Notice(0, "추가 공지사항 제목", "추가 공지사항 내용", null, 0, 0)));
		
		//System.out.println("deleteNotice() test:"+noticeDao.deleteNotice(9));
		
		//System.out.println("updateNotice() test:"+noticeDao.updateNotice(new Notice(10, "공지사항 제목 수정", "공지사항 내용 수정", null, 0, 1)));
		
		System.out.println("updateNoticeCount() test:"+noticeDao.updateNoticeCount(1));
		
		

	}
}

	
	

