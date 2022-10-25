package com.itwill.brown_carrot_market.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.TownReply;
import com.itwill.brown_carrot_market.service.TownReplyService;
@RestController
public class TownReplyRestController {
	@Autowired
	private TownReplyService townReplyService;
	
	
	/*
	@RequestMapping("/townReply_write_action")
	public Map<String, Object> townReply_write_action(@ModelAttribute TownReply townReply, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		String sUserId = (String)session.getAttribute("sUserId");
		
		try {
			int result = townReplyService.insertTownBoardReply(townReply);
			if (result == 1) {
				resultMap.put("errorCode", 1);
				resultMap.put("errorMsg", "게시글을 삭제하였습니다");
			} else {
				resultMap.put("errorCode", -2);
				resultMap.put("errorMsg", "게시글이 삭제되지 않았습니다");
			}
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -3);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		
		return resultMap;
	}
	*/
	
	
	
	
}
