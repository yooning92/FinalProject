package com.itwill.brown_carrot_market.test.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.ProductImageDao;
import com.itwill.brown_carrot_market.dao.ReviewImageDao;
import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.ReviewImage;

	@SpringBootApplication
	@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
	public class ReviewImageDaoSpringBootTestApplication {
		
		public static void main(String[] args) throws Exception{
			SpringApplication application = 
					new SpringApplication(ReviewImageDaoSpringBootTestApplication.class);
			application.setWebApplicationType(WebApplicationType.NONE);
			ConfigurableApplicationContext context=application.run(args);
			//ProductImageDao productImageDao=(ProductImageDao)context.getBean(ProductImageDao .class);
			ReviewImageDao reviewImageDao = (ReviewImageDao)context.getBean(ReviewImageDao .class);
			
			List<ReviewImage> reviewImages = new ArrayList<>();
			reviewImages.add(new ReviewImage(0, "test1.jpg", 39));
			reviewImages.add(new ReviewImage(0, "test2.jpg", 39));
			reviewImages.add(new ReviewImage(0, "test3.jpg", 39));
			reviewImages.add(new ReviewImage(0, "test4.jpg", 39));
			
			System.out.println(reviewImageDao.insertReviewImgList(reviewImages));
		}
}
