package com.itwill.brown_carrot_market.test.dao;

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

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class TownBoardDaoSpringBootTestApplication {

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
				new SpringApplication(TownBoardDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		TownBoardDao townBoardDao=(TownBoardDao)context.getBean(TownBoardDao.class);
		
		//System.out.println("selectNonMemberTownBoardList test:"+townBoardDao.selectNonMemberTownBoardList());
		//System.out.println("selectNonMemberCtgrTownBoardList test:"+townBoardDao.selectNonMemberCtgrTownBoardList(1));
		
		// 좌표값에 따라서 나와야해서 어디까지인지 다시 확인하기..일단 나오기는 하는듯
		//System.out.println("selectTownBoardListCoordinate test"+townBoardDao.selectTownBoardListCoordinate(new Address(1, null, 0, 0, 0, "carrot1")));
		
		//좌표값 + 카테고리 조건으로 검색.. 실패함 다시 보기.. .나오는데 좌표범위대로 나오는지는 잘 모르겠음 다시 보기..
		//System.out.println("selectTownBoardCtgrListCoordinate test : "+ townBoardDao.selectTownBoardCtgrListCoordinate(1,new Address(1, null, 0, 0, 0, "carrot1" )));
		
		//System.out.println("selectTownBoardOne test :"+townBoardDao.selectTownBoardOne(1));
		
		//System.out.println("delete test:"+townBoardDao.deleteTownBoardOne(9));
		
		//System.out.println("updateTownBoardOne test:"+townBoardDao.updateTownBoardOne(new TownBoard(7, "수정수정수정", "내용수정2", null, 0, new TownCategory(2, null), null, 0, 0, null, null, null)));
		
		//System.out.println("updateTownBoardCount test:"+townBoardDao.updateTownBoardCount(1));
		
		//System.out.println("selectTownBoardIdList test:"+townBoardDao.selectTownBoardIdList("carrot1"));
		

		/*
		Map map=townBoardDao.selectTownBoardAddress("carrot3", 5);
		Map pmap=new HashMap();
		pmap.put("townBoard", new TownBoard(0, "new new제목", "new 내용", null, 0, new TownCategory(3, null), null, 0, 0, new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), null, null));
		pmap.put("address", map);
		
		townBoardDao.insertTownBoard(pmap);
		 
		*/
		
		
		
	}
}

	
	

