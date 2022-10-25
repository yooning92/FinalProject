package com.itwill.brown_carrot_market.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.service.ProductService;
@Controller
public class ProductCategoryController {
	@Autowired
	private ProductService productService;
	
	public ProductCategoryController() {
		System.out.println("### ProductCategoryController() 기본생성자");
	}
	/*
	@RequestMapping(value = "/product_category", params = "category_no")
	public String guest_view(@RequestParam int p_ctgr_no,Model model,HttpSession session) throws Exception {
		System.out.println("들어오긴하니?");
		String sUserId = (String)session.getAttribute("sUserId");
		Address sAddress = (Address)session.getAttribute("sAddress");
		if(sUserId != null) {
			//로그인한 회원 주위의 상품 리스트
			List<Product> productLoginList = productService.selectListByRangeCtgr(p_ctgr_no, sAddress);
			model.addAttribute("productLoginList",productLoginList);
			return "product_login_list";
		}
		
		//비회원 상품리스트
		List<Product> productList = productService.selectAllByCtgr(p_ctgr_no);
		model.addAttribute("productList", productList);	
		return "product_list";
	}
	*/
	
	
	
	

}
