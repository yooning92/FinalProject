package com.itwill.brown_carrot_market.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.init.ScriptUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.ProductCategory;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.OrdersService;
import com.itwill.brown_carrot_market.service.ProductService;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private OrdersService ordersService;
	public ProductController() {
		System.out.println("### ProductController() 기본생성자");
	}
	
	//@CrossOrigin(origins = "http://192.168.15.12")
	@RequestMapping(value={"/product_list",
							"/product_login_list"})
	public String product_list(@RequestParam(required = false, defaultValue = "1") Integer pageno,Model model,HttpServletRequest req, HttpSession session) throws Exception {
		
		String sUserId = (String)session.getAttribute("sUserId");
		Address sAddress = (Address)session.getAttribute("sAddress");
		
		if(sAddress != null) {
			//로그인한 회원 주위의 상품 리스트
			PageMakerDto<Product> productLoginList = productService.selectListByRange(sAddress, pageno);
			model.addAttribute("productLoginList",productLoginList);
			model.addAttribute("pageno", pageno);
			return "product_login_list";
		}
		
		//비회원 상품리스트
		PageMakerDto<Product> productList = productService.selectProductAll(pageno);
		//List<Product> productList = productService.selectProductAll();
		model.addAttribute("productList", productList);	
		model.addAttribute("pageno", pageno);
		
		return "product_list";
	}
	
	
	@RequestMapping(value = {"/product_detail", "/product_login_detail"}, params = "p_no")
	public String product_view(@RequestParam int p_no,Model model,HttpSession session) throws Exception {
		String sUserId = (String)session.getAttribute("sUserId");
		Address sAddress = (Address)session.getAttribute("sAddress");
		//String forwardPath ="";
		Product product = productService.selectByOne(p_no);
		productService.updateProductCount(p_no);
		System.out.println(product);
		
		String user_id = product.getUserInfo().getUser_id();
		List<Product> userProductList = productService.selectByUserId(user_id); 
		System.out.println("userProductList :" + userProductList);
		
		model.addAttribute("product", product);
		model.addAttribute("userProductList", userProductList);
		
		
		if(sUserId == null || sUserId.equals("")) {
			System.out.println("user_id:"+user_id);
			return "product_detail";
		}else if(sUserId.equals(product.getUserInfo().getUser_id())) {
			model.addAttribute("address",sAddress);
			return "product_login_detail";
		}else {
			return "product_detail";
			
		}
		//List<Product> productList = productService.selectByUserId(user_id);
		//model.addAttribute("productList",productList);
	}
	
	@RequestMapping("/product_write_form")
	public String product_write_form(HttpSession session)throws Exception {
		System.out.println("product_write_form 컨트롤러 호출-productService: " + productService);
		String forwardPath = "";
		String sUserId = (String)session.getAttribute("sUserId");
		//비회원 로그인폼으로 보내버리기
		forwardPath = "user_login";
		//회원 상품등록
		if(sUserId != null) {
				
			forwardPath = "product_write_form";
		}
		
		return forwardPath;
	}
	
	@RequestMapping(value = "/product_write_action", method = RequestMethod.GET)
	public String product_write_action_get() {
		return "redirect : product_list";
	}
	
	//상품 수정하기 폼
	@RequestMapping(value = "/product_modify_form")
	public String product_modify_form(@RequestParam int p_no,Model model, HttpSession session) {
		System.out.println("product_modify_form 컨트롤러 호출-productService: " + productService);
		String forwardPath = "";
		String sUserId = (String)session.getAttribute("sUserId");
		//비회원 로그인폼으로 보내버리기
		forwardPath = "user_login";
		//회원 상품등록
		if(sUserId != null) {
			if(p_no == 0) {
				forwardPath = "redirect:product_list";
			}else {
				try {
					Product product = productService.selectByOne(p_no);
					model.addAttribute("product", product);
					System.out.println("modify>>>"+product);
					forwardPath = "product_modify_form";
					
				}catch(Exception e) {
					e.printStackTrace();
					model.addAttribute("MSG", e.getMessage());
					forwardPath = "product_error";
				}
			}
		}
		
		return forwardPath;
	}
	
	@RequestMapping(value = "/product_modify_action", method = RequestMethod.GET)
	public String product_modify_action_get() {
		return "redirect : product_list";
	}
	
	/*
	@RequestMapping(value = "/product_modify_action", method = RequestMethod.POST)
	public String product_modify_action(@RequestParam Map<String, Object> map,Model model) throws Exception {
		String forwardPath = "";
		try {
			int p_no = Integer.parseInt((String) map.get("p_no"));
			ProductCategory productCategory = new ProductCategory(Integer.parseInt(map.get("p_ctgr_no").toString()), "");
			map.put("productCategory", productCategory);
			map.remove("p_ctgr_no");
			
			int updateRowCount = productService.updateProduct(map);
			System.out.println(">>>modify product"+map);
			
			forwardPath = "redirect:product_detail?p_no=" + p_no;
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("MSG", e.getMessage());
			forwardPath = "product_error";
		}
		return forwardPath;
	}
	*/
	/*
	@RequestMapping(value = "/product_write_action", method = RequestMethod.POST)
	public String product_write_action(@RequestParam Map<String, Object> map, Model model, HttpSession session) {
		String forwardPath = "";
		String sUserId = (String)session.getAttribute("sUserId");
		//map.put("user_id", sUserId);
		Address sAddress = (Address)session.getAttribute("sAddress");
		map.put("address", sAddress);
		
		String message = "";
		String newFileName= "";

		try {

			UserInfo userInfo = new UserInfo(sUserId, sUserId, sUserId, sUserId, forwardPath, 0, 0, sUserId, null);
			map.put("userInfo", userInfo);	
			ProductCategory productCategory = new ProductCategory(Integer.parseInt(map.get("p_ctgr_no").toString()), "");
			map.put("productCategory", productCategory);
			map.remove("p_ctgr_no");
			//map.put("product", map);
			
			
			/*사진
			List<String> fileNames = new ArrayList<>();

			for (MultipartFile file : files) {
				System.out.println(file.isEmpty());
				if (!file.isEmpty()) {
					newFileName= storageService.save(file);
					fileNames.add(file.getOriginalFilename());

					message = "Uploaded the files successfully: " + fileNames+" newFileName"+newFileName;
				}else {
					message="Please select a valid mediaFile..";
				}
			}
			map.put("newFileName",newFileName);
			
			
			System.out.println("controller map : "+map);
			
			
			
			
			//인서트해주기
			int insertRowCount = productService.insertProduct(map);
			
			
			forwardPath = "redirect:product_list";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("MSG", "잘모르는실패!!!");
			forwardPath = "redirect:main";
		}
		return forwardPath;
	}
	*/
	@RequestMapping(value = "/product_delete_action", method = RequestMethod.GET)
	public String product_delete_action_get() {
		return "redirect : product_list";
	}
	
	//상품삭제
	@RequestMapping(value = "/product_delete_action", method = RequestMethod.POST)
	public String product_delete_action(@RequestParam int p_no,HttpSession session) throws Exception {
		String sUserId = (String)session.getAttribute("sUserId");
		
		int insertRowCount = productService.deleteByPNo(p_no);
		
		return "redirect : product_list";
	}
	
	
	//상품 판매상태
	@RequestMapping(value = "/product_modify_sell_action")
	public String product_modify_sell_action(@RequestParam(value = "p_sell", required = false, defaultValue = "")int p_sell,@RequestParam(value = "p_no", required = false, defaultValue = "")int p_no,@RequestParam(value = "user_id", required = false, defaultValue = "")String user_id) {
		String forwardPath = "";
		try {
			System.out.println("---------------------------------");
			System.out.println(p_sell);
			System.out.println(p_no);
			System.out.println(user_id);
			if(p_sell==1) {
				Product product = productService.selectByOne(p_no);
				int o_no = ordersService.selectByP_No(product.getP_no()).getOrders_no();
				int result = ordersService.deleteOrders(o_no);	
				int updateRowCount = productService.updateProductSell(p_sell, p_no);
				forwardPath = "redirect:product_list";
				
			}else {
				int updateRowCount = productService.updateProductSell(p_sell, p_no);
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			forwardPath = "product_list";
		}
		
		
		return forwardPath;
	}
	
	
	
}
