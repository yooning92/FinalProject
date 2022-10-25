package com.itwill.brown_carrot_market.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.ProductCategory;
import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.ProductService;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageServiceProduct;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@RestController
public class ProductRestController {
		@Autowired
		private ProductService productService;
		
		@Autowired
		@Qualifier(value="FilesStorageServiceImplProduct")
		FilesStorageServiceProduct storageService;
		
	@PostMapping("product_write_action_json")
	public Map product_write_action_json(@RequestParam("files") MultipartFile[] files,@RequestParam Map<String, Object> map, Model model, HttpSession session)throws Exception{
		int code = 0;
		String url = "product_list"; //어디로 보내야지?
		String message="product_write 실패";
		String newFileName= "";
		
		//사진저장
		Map<String,Object> resultMap = new HashMap();
		try {
			List<String> fileNames = new ArrayList<>();

			for (MultipartFile file : files) {
				System.out.println(file.isEmpty());
				if (!file.isEmpty()) {
					newFileName= storageService.save(file);
					//fileNames.add(file.getOriginalFilename());
					fileNames.add(newFileName);
					
					System.out.println(fileNames);
					message = "Uploaded the files successfully: " + fileNames+" newFileName"+newFileName;
				}else {
					message="Please select a valid mediaFile..";
				}
			}
			//사진 이름 리스트화
			
									
			
			//resultMap.put("message", message);
			//resultMap.put("newFileName", newFileName);
		
		
		//map.put("productImageList", fileNames.get(0));
		
		String sUserId = (String)session.getAttribute("sUserId");
		//map.put("user_id", sUserId);
		Address sAddress = (Address)session.getAttribute("sAddress");
		map.put("address", sAddress);
		UserInfo userInfo = new UserInfo(sUserId, sUserId, sUserId, sUserId, null, 0, 0, sUserId, null);
		map.put("userInfo", userInfo);	
		ProductCategory productCategory = new ProductCategory(Integer.parseInt(map.get("p_ctgr_no").toString()), "");
		map.put("productCategory", productCategory);
		map.put("ImageNameList", fileNames);
		
		
		map.remove("p_ctgr_no");
		
		
		
		Product resultList = new Product();
		
		System.out.println("RestController-user_update_profile_json() 호출");
		
		code = productService.insertProduct(map);
		if(code==1) message="product_write 성공";
		url="product_detail?p_no="+(Integer.parseInt(map.get("p_no").toString()));
		System.out.println("restController>>>"+map);
		
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("message", message);
		resultMap.put("data",resultList);
		
		
		return resultMap;
		
		} catch (Exception e) {
			e.printStackTrace();
			url = "product_list";
			message = "Fail to upload files!";
			resultMap.put("message", message);
			resultMap.put("url", url);
			
			//return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
			return resultMap;
		}
		
		}
	
	
	
	//게시글 수정
	@PostMapping(value = "/product_modify_action_json")
	public Map product_modify_action_json(@RequestParam("files") MultipartFile[] files,@RequestParam Map<String, Object> map,Model model) throws Exception {
		int code = 0;
		String url = "product_list"; //어디로 보내야지?
		String message="product_write 실패";
		String newFileName= "";
		int p_no = Integer.parseInt((String) map.get("p_no"));
		int deleteRowCount = productService.deleteProductImg(p_no);
		
		Map<String,Object> resultMap = new HashMap();
		try {
			
			//사진업로드
			List<String> fileNames = new ArrayList<>();
			for (MultipartFile file : files) {
				System.out.println(file.isEmpty());
				if (!file.isEmpty()) {
					newFileName= storageService.save(file);
					//fileNames.add(file.getOriginalFilename());
					fileNames.add(newFileName);
					
					System.out.println(fileNames);
					message = "Uploaded the files successfully: " + fileNames+" newFileName"+newFileName;
				}else {
					message="Please select a valid mediaFile..";
				}
			}
			
			
			
			ProductCategory productCategory = new ProductCategory(Integer.parseInt(map.get("p_ctgr_no").toString()), "");
			map.put("productCategory", productCategory);
			map.put("ImageNameList", fileNames);
			map.remove("p_ctgr_no");
			
			Product resultList = new Product();
			
			code = productService.updateProduct(map);
			if(code==1) message="product_write 성공";
			System.out.println(">>>modify product"+map);
			url = "product_detail?p_no=" + p_no;
			
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("message", message);
			resultMap.put("data",resultList);
			
			return resultMap;
			
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("MSG", e.getMessage());
			url = "product_error";
			message = "Fail to upload files!";
			resultMap.put("message", message);
			resultMap.put("url", url);
			
			return resultMap;
		}
	}
	
	@RequestMapping("/product_list_rest")
	public Map<String,Object> product_list_rest(@RequestParam(required = false, defaultValue = "1") Integer pageno, 
												HttpSession session, HttpServletRequest req,
												@RequestParam Map<String, Object> map, 
												@RequestParam(required = false, defaultValue = "0") int p_ctgr_no) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		//PageMakerDto<Product> productList = null;
		String sUserId = (String)session.getAttribute("sUserId");
		Address sAddress = (Address)session.getAttribute("sAddress");
		
		System.out.println("product_list_rest컨트롤러 map :"+map);
		
		try {
		if(sAddress!=null) {
			PageMakerDto<Product> productLoginList = null;
			if(p_ctgr_no==0) {
				productLoginList = productService.selectListByRange(sAddress, pageno);
				resultMap.put("errorCode", 1); 
				resultMap.put("errorMsg", "회원 일반 성공");
				resultMap.put("data", productLoginList);
			}else {
				map.put("user_id", sUserId);
				map.put("address_no", sAddress.getAddress_no());
				map.put("address", sAddress);
				productLoginList = productService.selectListByRangeCtgr(map, p_ctgr_no, pageno);
				resultMap.put("errorCode", 2); 
				resultMap.put("errorMsg", "회원 카테고리 성공");
				resultMap.put("data", productLoginList);
			}
			
		}else {
		//비회원
		PageMakerDto<Product> productList = null;
			if(p_ctgr_no==0) {
				productList = productService.selectProductAll(pageno);
				resultMap.put("errorCode",3); 
				resultMap.put("errorMsg", "비회원 일반 성공");
				resultMap.put("data", productList);
			}else {
				productList = productService.selectAllByCtgr(p_ctgr_no, pageno);
				resultMap.put("errorCode",3); 
				resultMap.put("errorMsg", "비회원 카테고리 성공");
				resultMap.put("data", productList);
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		
		return resultMap;
	}
	
	@RequestMapping("/deleteProduct")
	public Map<String,Object> deleteProduct(@RequestParam int p_no,HttpSession session)throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		int result =0;
		
		result=productService.deleteByPNo(p_no);
		
		resultMap.put("data", result);
		
		return resultMap;
	}
	
	
}
