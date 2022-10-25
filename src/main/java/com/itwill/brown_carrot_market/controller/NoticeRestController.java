package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.service.NoticeService;
import com.itwill.brown_carrot_market.util.PageMakerDto;


@RestController
public class NoticeRestController {
	@Autowired
	private NoticeService noticeService;
	
	
	
	
	/*
	 * 게시글 리스트 반환 (REST)
	 */
	@RequestMapping("/notice_list_rest")
	public  Map<String, Object> notice_list_rest(@RequestParam(required = false, defaultValue = "1") Integer pageno) {
		Map<String, Object> resultMap = new HashMap<>();	
		PageMakerDto<Notice> noticeList = null;
		try {
			noticeList = noticeService.selectAll(pageno);
			resultMap.put("errorCode", 1); 
			resultMap.put("errorMsg", "성공");
			resultMap.put("data", noticeList);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		return resultMap;
	}
	
	/*
	 * 게시글 삭제
	 */
	@RequestMapping("/notice_delete_rest")
	public Map<String, Object> notice_delete_rest(Integer pageno, Integer notice_no, HttpSession session){
		Map<String, Object> resultMap = new HashMap<>();
		if (pageno == null || notice_no == null) {
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "잘못된 접근입니다");
		}
		/*
		 * String sUserId = (String)session.getAttribute("sUserId");
		if(sUserId != "admin") {
			return "redirect:notice_list";
		}
		*/
		try {
			int result = noticeService.deleteNotice(notice_no);
			if (result == 1) {
				resultMap.put("errorCode", 1);
				resultMap.put("errorMsg", "게시글을 삭제하였습니다");
			} else {
				resultMap.put("errorCode", -2);
				resultMap.put("errorMsg", "게시글이 삭제되지 않았습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -3);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		
		return resultMap;
	}
	
	
	
	
	
	
	
}
