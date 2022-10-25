package com.itwill.brown_carrot_market.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Transfer;
import com.itwill.brown_carrot_market.service.TransferService;

@RestController
public class TransferRestController {
	@Autowired
	private TransferService transferService;

	@LoginCheck
	@GetMapping("/point_list_json")
	public Map transfer_view_json(HttpServletRequest request, Transfer transfer) throws Exception {
		Map resultMap = new HashMap();
		int code = 1;
		String url = "";
		String msg = "";
		String sUserId = (String) request.getSession().getAttribute("sUserId");
		List<Transfer> resultList = transferService.selectById(sUserId);

		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data", resultList);

		return resultMap;
	}

}
