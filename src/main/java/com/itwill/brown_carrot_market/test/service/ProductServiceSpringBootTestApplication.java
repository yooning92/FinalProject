package com.itwill.brown_carrot_market.test.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.brown_carrot_market.dao.ProductDao;
import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.ProductCategory;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.ProductService;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.brown_carrot_market"})
public class ProductServiceSpringBootTestApplication {
	public static void main(String[] args) throws Exception{
		SpringApplication application = 
				new SpringApplication(ProductServiceSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		ProductService productService=(ProductService)context.getBean(ProductService.class);
		//System.out.println(productDao.selectProductAll());
		//System.out.println(productDao.selectAllByCtgr(2));
		//System.out.println(productDao.selectListByRange(new Address(1, null, 0, 0, 0, "carrot1")));
		//System.out.println(productDao.selectListByRangeCtgr(2, new Address(1, null, 0, 0, 0, "carrot1")));
		//System.out.println(productDao.selectByUserId("carrot1"));
		//System.out.println(productDao.selectByOne(3));
		//상품 삭제 이미지 on DELETE CASCADE 써줘야함
		//https://wakestand.tistory.com/205
		//System.out.println(productDao.deleteByPNo(11));
		//System.out.println(productDao.updateProductCount(1));
		//System.out.println(productDao.updateProduct(new Product(11, "한글책수정", "수정해봅니다", 10000, null, 1, 0, 0, null, 0, 0, new ProductCategory(5, null), null, null, null)));
		//이거 됨
		//System.out.println(productDao.updateProductWishCount(15));
		
		//List<Address> addressList = new ArrayList<Address>();
		//addressList.add(new Address(1, null, 0.0, 0.0, 0, null));
		//System.out.println(productDao.insertProduct(new Product(0, "제발요", "되게해주세요", 1000, null, 0, 0, 0, null, 0, 0, new ProductCategory(1, null), new UserInfo("carrot1", null, null, null, null, 0, 0, null, null), null, addressList)));
		
		
		//address를 뽑아옴
	
		//Map map=productDao.selectProductAddress("carrot3", 5);
		/*
		Map pmap=new HashMap();
		pmap.put("product",new Product(0, "이미지테스트", "되게해주세요", 1000, null, 0, 0, 0, null, 0, 0, new ProductCategory(1, ""), new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), null, null));
		//pmap.put("product",new Product(0, "이미지테스트", "되게해주세요", 1000, null, 0, 0, 0, null, 0, 0, new ProductCategory(1, ""), new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), null, null));
		pmap.put("address", new Address(5, "test주소", 37, 45, 2, "carrot3"));
		System.out.println(productDao.insertProduct(pmap));
		*/
		//System.out.println(productDao.updateProductSell(1, 15));
		
		Map pmap=new HashMap();
		pmap.put("product",new Product(0, "이미지테스트", "되게해주세요", 1000, null, 0, 0, 0, null, 0, 0, new ProductCategory(1, ""), new UserInfo("carrot3", null, null, null, null, 0, 0, null, null), null, null));
		
	}
	
/*
 
import org.springframework.boot.SpringApplication;
import org.springframework.boot.WebApplicationType;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.ComponentScan;

import com.itwill.guest.GuestDao;

@SpringBootApplication
@ComponentScan(basePackages = {"com.itwill.guest"})
public class GuestDaoSpringBootTestApplication {
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
		
		
		SpringApplication application = 
				new SpringApplication(GuestDaoSpringBootTestApplication.class);
		application.setWebApplicationType(WebApplicationType.NONE);
		ConfigurableApplicationContext context=application.run(args);
		GuestDao guestDao=(GuestDao)context.getBean(GuestDao.class);
		System.out.println(guestDao.selectAll());
		System.out.println(guestDao.selectByNo(881));
		 

	}
}
 */
	
	
}
