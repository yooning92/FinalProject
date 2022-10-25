package com.itwill.brown_carrot_market.test.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.NoticeDao;
import com.itwill.brown_carrot_market.dao.TownBoardDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.Review;
import com.itwill.brown_carrot_market.dto.ReviewImage;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.NoticeService;
import com.itwill.brown_carrot_market.service.ReviewService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class ReviewServiceSpringBootTestApplication {

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
				new SpringApplication(ReviewServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		ReviewService reviewService=(ReviewService)context.getBean(ReviewService.class);
		
		//System.out.println("findReceivedReview() test: "+reviewService.findReceivedReview("carrot1"));
		
		//System.out.println("findReceivedReviewByBuyer() test: "+reviewService.findReceivedReviewByBuyer("carrot3"));
		
		//System.out.println("findReceivedReviewBySeller() test: "+reviewService.findReceivedReviewBySeller("carrot1"));	

		int orders_no = 22;
		Orders orders = new Orders(orders_no, null, null, null, null, null);
		UserInfo userInfo = new UserInfo("tjdudg", null, null, null, null, 0, 0, null, null);
		List<ReviewImage> reviewImages = new ArrayList<>();
		reviewImages.add(new ReviewImage(0, "test1.jpg", 39));
		reviewImages.add(new ReviewImage(0, "test2.jpg", 39));
		reviewImages.add(new ReviewImage(0, "test3.jpg", 39));
		reviewImages.add(new ReviewImage(0, "test4.jpg", 39));		
		Review review = new Review(0, "service 테스트", "이자리는 무시", 3.5, orders, userInfo,reviewImages); 
		
		//System.out.println("result() test: "+reviewService.createReview(review));	
		
	}
}

	
	

