package com.itwill.brown_carrot_market.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.TransferService;
import com.itwill.brown_carrot_market.service.UserInfoService;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;


@Controller
public class PaymentController {
	@Autowired
	private TransferService transferService;
	@Autowired
	private UserInfoService userInfoService;
	
	@LoginCheck
	@RequestMapping(value = "/payment_deposit")
	public String payment_deposit(Model model, UserInfo userInfo,HttpServletRequest request) throws Exception{
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		userInfoService.findUser("sUser");
		if(sUserId==null || sUserId.equals("")) {
			return "user_login";
		}else {
			return "/payment_deposit";
		}
	}
	
	@LoginCheck
	@RequestMapping(value = "/payment_withdraw")
	public String payment_withdraw(Model model, UserInfo userInfo,HttpServletRequest request) throws Exception{
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		userInfoService.findUser("sUser");
		model.addAttribute("userInfo",userInfo);
		if(sUserId==null || sUserId.equals("")) {
			return "user_login";
		}else {
			return "/payment_withdraw";
		}
	}
	
//	@LoginCheck
//	@RequestMapping(value = "/payment_deposit")
//	public String payment_deposit(Model model, HttpServletRequest request) throws Exception{
//		String sUserId=(String)request.getSession().getAttribute("sUserId");
//		request.getSession().setAttribute("sUserId", sUserId);
//		if(sUserId==null || sUserId.equals("")) {
//			return "user_login";
//		}else {
//			return "/payment_deposit";
//		}
//	}
	
	@LoginCheck
	@RequestMapping(value = "/payment_deposit_complete")
	public String payment_deposit_complete(int payment_amount,Model model, HttpServletRequest request) throws Exception{
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		UserInfo sUser=(UserInfo)request.getSession().getAttribute("sUser");
		request.getSession().setAttribute("sUserId", sUserId);
		if(sUserId==null || sUserId.equals("")) {
			return "user_login";
		}else {
			model.addAttribute("payment_amount",payment_amount);
			transferService.insert_Point_Deposit(payment_amount, sUserId);
			transferService.update_Point_By_Id_Deposit(sUserId);
			UserInfo userInfo = userInfoService.findUser(sUserId);
			model.addAttribute("userInfo",userInfo);
			return "payment_deposit_complete";
		}
	}
	
	@LoginCheck
	@RequestMapping(value = "/payment_deposit_fail")
	public String payment_depost_fail(Model model, HttpServletRequest request) throws Exception{
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		request.getSession().setAttribute("sUserId", sUserId);
		if(sUserId==null || sUserId.equals("")) {
			return "user_login";
		}else {
			return "payment_deposit_fail";
		}
	}
	
	@RequestMapping(value = "/payment_withdraw_complete")
	public String payment_withdraw_complete(int amount, String account, Model model, HttpServletRequest request) throws Exception{
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		UserInfo sUser=(UserInfo)request.getSession().getAttribute("sUser");
		request.getSession().setAttribute("sUserId", sUserId);
		if(sUserId==null || sUserId.equals("")) {
			return "user_login";
		}else {
			model.addAttribute("account", account);
			model.addAttribute("amount", amount);
			transferService.insert_Point_Withdraw(amount, sUserId);
			transferService.update_Point_By_Id_Withdraw(sUserId);
			System.out.println(amount);
			System.out.println(account);
			UserInfo userInfo = userInfoService.findUser(sUserId);
			model.addAttribute("userInfo",userInfo);
			return "payment_withdraw_complete";
		}
	}
	
	@LoginCheck
	@RequestMapping(value = "/payment_withdraw_fail")
	public String payment_withdraw_fail(Model model, HttpServletRequest request) throws Exception{
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		request.getSession().setAttribute("sUserId", sUserId);
		if(sUserId==null || sUserId.equals("")) {
			return "user_login";
		}else {
			return "payment_withdraw_fail";
		}
	}
	
}