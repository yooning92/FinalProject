package com.itwill.brown_carrot_market.test.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.TownBoardService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownBoardServiceSpringBootTestApplication {

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
				new SpringApplication(TownBoardServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownBoardService townBoardService=(TownBoardService)context.getBean(TownBoardService.class);
		/*
		//System.out.println("selectNonMemberTownBoardList test:"+townBoardService.selectNonMemberTownBoardList());
		
		System.out.println("selectNonMemberCtgrTownBoardList test:"+townBoardService.selectNonMemberCtgrTownBoardList(1));
		
		// 좌표값에 따라서 나와야해서 어디까지인지 다시 확인하기..일단 나오기는 하는듯
		System.out.println("selectTownBoardListCoordinate test"+townBoardService.selectTownBoardListCoordinate(new Address(1, null, 0, 0, 0, "carrot1")));
		
		//좌표값 + 카테고리 조건으로 검색.. 실패함 다시 보기.. .나오는데 좌표범위대로 나오는지는 잘 모르겠음 다시 보기..
		System.out.println("selectTownBoardCtgrListCoordinate test : "+ townBoardService.selectTownBoardCtgrListCoordinate(1,new Address(1, null, 0, 0, 0, "carrot1" )));
		
		System.out.println("selectTownBoardOne test :"+townBoardService.selectTownBoardOne(1));
		
		System.out.println("delete test:"+townBoardService.deleteTownBoardOne(11));
		
		System.out.println("updateTownBoardOne test:"+townBoardService.updateTownBoardOne(new TownBoard(7, "수정수정수정", "내용수정2", null, 0, new TownCategory(2, null), null, 0, 0, null, null, null)));
		
		System.out.println("updateTownBoardCount test:"+townBoardService.updateTownBoardCount(1));
		
		System.out.println("selectTownBoardIdList test:"+townBoardService.selectTownBoardIdList("carrot1"));
		
		//System.out.println("insert test:"+townBoardService.insertTownBoard(new TownBoard(0, "new 제목", "new 내용", null, 0, new TownCategory(3, null), "서초동", 0, 0, new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), null, null)));
		
		Map map=townBoardService.selectTownBoardAddress("carrot3", 5);
		Map pmap=new HashMap();
		pmap.put("townBoard", new TownBoard(0, "new new2제목", "new 내용", null, 0, new TownCategory(3, null), null, 0, 0, new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), null, null));
		pmap.put("address", map);
		
		townBoardService.insertTownBoard(pmap);
		*/
		
	}
}

	
	

