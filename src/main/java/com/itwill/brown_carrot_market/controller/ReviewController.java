package com.itwill.brown_carrot_market.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwill.brown_carrot_market.dto.Orders;
import com.itwill.brown_carrot_market.dto.Review;
import com.itwill.brown_carrot_market.dto.ReviewImage;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.OrdersService;
import com.itwill.brown_carrot_market.service.ReviewService;
import com.itwill.brown_carrot_market.service.UserInfoService;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageServiceUser;

import ch.qos.logback.core.net.SyslogOutputStream;

@Controller
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	@Qualifier(value = "FilesStorageServiceImplReview")
	FilesStorageServiceUser storageService;
	
	@Autowired
	private UserInfoService userInfoService;
/*
	@Autowired
	private OrdersService ordersService;
*/
	public ReviewController() {
		System.out.println(">> ReviewController()생성");
	}
/*
	@RequestMapping("/review_write_form")
	public String review_write_form() {
		return "review_write_form";
	}
*/
	
	@RequestMapping("review_modify_action")
	public String review_modify_action(@RequestParam Map<String, Object> map, HttpServletRequest request) throws Exception {
		System.out.println("review_modify_action >>> map: "+map);

		String json = map.get("review").toString();
		ObjectMapper mapper = new ObjectMapper();
		Review review = mapper.readValue(json, new TypeReference<Review>() {});
		System.out.println("review >>" + review);
		
		//[INSERT] review_img
		json = map.get("images").toString();
		if (json != null && json != "") { // image가 업로드 된 경우에만
			List<ReviewImage> reviewImages = mapper.readValue(json, new TypeReference<ArrayList<ReviewImage>>() {
			});
			review.setReviewImageList(reviewImages);
		}
		
		//[UPDATE] review
		int result= reviewService.updateReview(review);
		System.out.println("reviewService.updateReview>> result: "+result);
		
		//[DELETE] review_img
		json = map.get("del_img").toString();
		if (json != null && json != "") {// 삭제할image가 있는 경우에만
			String[] del_img = mapper.readValue(json, new TypeReference<String[]>() {});
			List<String> delImgList = new ArrayList();
			for (int i = 0; i < del_img.length; i++) {
				delImgList.add(del_img[i]);
			}
			System.out.println("delImgList >>" +delImgList);
			if(delImgList.size() !=0 || delImgList!=null) {
				for (String delImg : delImgList) {
					//DB 삭제
					result += reviewService.removeReviewImgByName(delImg);
					//업로드된 파일삭제
					storageService.delete(delImg);
				}
				//result = reviewService.removeReviewImgByNoList(delImgList);
				System.out.println("removeReviewImgByNoList결과 >> "+result);
			}
		}
		//[UPDATE] your_id의 user_freshness
		UserInfo you =  userInfoService.findUser(review.getYour_id());
		// your_id가 받은 review갯수
		double yourReviewCount = reviewService.countReceivedReview(review.getYour_id());
		System.out.println("your_id의 기존Freshness: " + you.getUser_freshness() + ", 리뷰갯수: " + yourReviewCount);
		
		json = map.get("point_prev").toString();
		int point_prev = mapper.readValue(json, new TypeReference<Integer>() {
		});
		System.out.println("point_prev >>" + point_prev);
		
		double updateFreshness = you.getUser_freshness()+(-point_prev+review.getReview_point())/yourReviewCount;
		you.setUser_freshness(updateFreshness);
		userInfoService.updateFreshness(you);
		
		return "redirect:orders_list";
	}
	
	
	@PostMapping("/review_write_action")
	public String review_write_action(@RequestParam Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		System.out.println("****review_write_action - map: " + map);

		String json = map.get("review").toString();
		ObjectMapper mapper = new ObjectMapper();
		Review review = mapper.readValue(json, new TypeReference<Review>() {
		});
		System.out.println("review >>" + review);

		json = map.get("orders_no").toString();
		int orders_no = mapper.readValue(json, new TypeReference<Integer>() {
		});
		System.out.println("orders_no >>" + orders_no);
		review.setOrders(new Orders(orders_no, null, null, null, null, null));

		json = map.get("images").toString();
		if (json != null && json != "") { // image가 업로드 된 경우에만
			List<ReviewImage> reviewImages = mapper.readValue(json, new TypeReference<ArrayList<ReviewImage>>() {
			});
			System.out.println("reviewImages >>" + reviewImages);
			review.setReviewImageList(reviewImages);
		}

		UserInfo sUser = (UserInfo) request.getSession().getAttribute("sUser");
		review.setUserInfo(sUser);

		//if (result > 0) {// review INSERT성공시 -> 상대방user_freshness UPDATE
			//String your_id = map.get("your_id").toString();
			//System.out.println("user_freshness UPDATE: your_id >>" + your_id);
			//review.setYour_id(your_id);
			int result = reviewService.createReview(review);
			UserInfo you = userInfoService.findUser(review.getYour_id());

			// your_id가 받은 review갯수
			double yourReviewCount = reviewService.countReceivedReview(review.getYour_id());
			System.out.println("your_id의 기존Freshness: " + you.getUser_freshness() + ", 리뷰갯수: " + yourReviewCount);
			// your_id의 freshness
			// you.getUser_freshness();
			// 내가 준 review_point
			// review.getReview_point();
			// [{(your_id의 freshness)*(your_id가 받은 review갯수)}+내가 준 review_point]/(your_id가
			// 받은 review갯수+1)
			double updateFreshness = ((you.getUser_freshness() * yourReviewCount) + review.getReview_point())
					/ (yourReviewCount + 1);
			you.setUser_freshness(updateFreshness);
			// your_id의 매너온도 UPDATE
			int updateResult = userInfoService.updateFreshness(you);
			System.out.println("your_id의 updateFreshness: " + updateFreshness + ", result: " + updateResult);
		//}

		return "redirect:orders_list";
	}

	@RequestMapping("review_view")
	public String review_view(int review_no, Model model, HttpServletRequest request) throws Exception {
		System.out.println("review_view >>> review_no :" + review_no);

		Review review = reviewService.findReviewByRivewNo(review_no);
		model.addAttribute("review",review);
		System.out.println("result :" + review);
		
		int showHeight = 220;
		if(review.getReviewImageList().size()>0) {
			showHeight= 220 *(review.getReviewImageList().size()/2+1);
		}
		model.addAttribute("showHeight",showHeight);
		
		return "review_view";
	}
	@RequestMapping("review_write_form")
	public String review_write_form(int orders_no,String your_id, String p_title,Model model, HttpServletRequest request) throws Exception {
		System.out.println("review_write_form >>> " );
		
		model.addAttribute("orders_no",orders_no);
		System.out.println("orders_no"+orders_no);
	
		model.addAttribute("p_title",p_title);
		System.out.println("p_title"+p_title);
		/*
		Orders orders = ordersService.selectByNo(orders_no);
		model.addAttribute("orders",orders);
		System.out.println("orders"+orders);
		*/
		model.addAttribute("your_id",your_id);
		System.out.println("your_id"+your_id);
		
		return "review_write_form";
	}

	@RequestMapping("review_modify_form")
	public String review_write_form(@RequestParam int review_no, Model model,HttpServletRequest request) throws Exception {
		System.out.println("review_modify_form >>> review_no :" + review_no);
		
		Review review = reviewService.findReviewByRivewNo(review_no);
		model.addAttribute("review",review);
		System.out.println("result :" + review);
		
		int showHeight = 220;
		if(review.getReviewImageList().size()>0) {
			showHeight= 220 *(review.getReviewImageList().size()/2+1);
		}
		model.addAttribute("showHeight",showHeight);
		
		return "review_modify_form";
	}

	@RequestMapping("review_remove_action")
	public String review_remove_action(@RequestParam int review_no, HttpServletRequest request) throws Exception {
		System.out.println("review_remove_action >>> review_no: "+review_no);
		
		Review review= reviewService.findReviewByRivewNo(review_no);
		Map<String,Object> resultMap = new HashMap();
		List<Boolean> result = new ArrayList();
		boolean deleteResult= false;
		if(review.getReviewImageList()!=null) {
			System.out.println("review.getReviewImageList(): "+review.getReviewImageList());
			for (ReviewImage reviewImage : review.getReviewImageList()) {
				deleteResult= storageService.delete(reviewImage.getReview_img_name());
			}
			result.add(deleteResult);
		}
		resultMap.put("result",result);
		System.out.println("resultMap: "+resultMap);
		int removeResult = reviewService.removeReview(review_no);
		System.out.println("removeResult: "+removeResult);
		return "redirect:orders_list";
	}

}
