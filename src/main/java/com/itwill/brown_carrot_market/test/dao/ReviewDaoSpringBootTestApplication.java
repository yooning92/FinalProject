package com.itwill.brown_carrot_market.test.dao;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dao.ReviewDao;
import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.Review;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.UserInfo;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class ReviewDaoSpringBootTestApplication {

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
		
		  SpringApplication application = new
		  SpringApplication(ReviewDaoSpringBootTestApplication.class);
		  application.setWebApplicationType(WebApplicationType.NONE);
		  ConfigurableApplicationContext context=application.run(args);
		 
		ReviewDao reviewDao = (ReviewDao)context.getBean(ReviewDao.class);
		
		//values(REVIEW_REVIEW_NO_SEQ.nextval,'친절하고 약속시간을 잘지켜요','',0.1, 1,'carrot5');
		Review review = new Review(0, "Dao Test", "", 0.1, new Orders(1, null, null, null,null, 
									new ProductImage(0,null, 0)),
									new UserInfo("carrot5", null, null, null, null, 0, 0, null, null),
									null);
		System.out.println("createReview() test: "+reviewDao.createReview(review));

		System.out.println("findReceivedReview() test: "+reviewDao.findReceivedReview("carrot1"));
		
		System.out.println("findReceivedReviewByBuyer() test: "+reviewDao.findReceivedReviewByBuyer("carrot3"));
		
		System.out.println("findReceivedReviewBySeller() test: "+reviewDao.findReceivedReviewBySeller("carrot1"));
	}
}

	
	

