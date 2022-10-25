package com.itwill.brown_carrot_market.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.Notice;
import com.itwill.brown_carrot_market.dto.Product;
import com.itwill.brown_carrot_market.dto.ProductCategory;
import com.itwill.brown_carrot_market.dto.TownBoard;
import com.itwill.brown_carrot_market.dto.TownCategory;
import com.itwill.brown_carrot_market.dto.TownReply;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.TownBoardService;
import com.itwill.brown_carrot_market.service.TownReplyService;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageServiceProduct;
import com.itwill.brown_carrot_market.upload_file.service.FilesStorageServiceTownBoard;
import com.itwill.brown_carrot_market.util.PageMakerDto;

@RestController
public class TownBoardRestController {
	@Autowired
	@Qualifier("townBoardServiceImpl")
	private TownBoardService townBoardService;
	
	@Autowired
	@Qualifier("townReplyServiceImpl")
	private TownReplyService townReplyService;
	
	@Autowired
	@Qualifier(value="FilesStorageServiceImplTownBoard")
	FilesStorageServiceTownBoard storageService;
	
	/*
	 * 게시글 리스트 반환 (REST)
	 */
	@RequestMapping("/townBoard_list_rest")
	public  Map<String, Object> townBoard_list_rest(@RequestParam(required = false, defaultValue = "1") Integer pageno, HttpSession session, @RequestParam Map<String, Object> map, @RequestParam(required = false, defaultValue = "0") int t_ctgr_no) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();	
		PageMakerDto<TownBoard> townBoardList = null;
		String sUserId = (String)session.getAttribute("sUserId");
		Address sAddress = (Address)session.getAttribute("sAddress");
		
		System.out.println("townBoard_list_rest컨트롤러 map :"+map);
		
		try { 
			//회원 게시글 리스트 반환
			if(sUserId != null) {
				if(t_ctgr_no==0) {
					townBoardList = townBoardService.selectTownBoardListCoordinate(sAddress, pageno);
					resultMap.put("errorCode", 1); 
					resultMap.put("errorMsg", "회원 일반 성공");
					resultMap.put("data", townBoardList);
					
					List<TownBoard> townBoardListTop = townBoardService.selectNonMemberTownBoardListTop3();
					
				}
				if(t_ctgr_no != 0) {
					
					map.put("user_id", sUserId);
					map.put("address_no", sAddress.getAddress_no());
					map.put("address", sAddress);
					
					townBoardList = townBoardService.selectTownBoardCtgrListCoordinate(map,t_ctgr_no, pageno);
					resultMap.put("errorCode", 2); 
					resultMap.put("errorMsg", "회원 카테고리 성공");
					resultMap.put("data", townBoardList);
					
				}
					
			}
			//비회원 게시글 리스트 반환
			if(sUserId == null) {
				if(t_ctgr_no==0) {
					townBoardList = townBoardService.selectNonMemberTownBoardList(pageno);
					resultMap.put("errorCode",3); 
					resultMap.put("errorMsg", "비회원 일반 성공");
					resultMap.put("data", townBoardList);
					
				}
				if(t_ctgr_no != 0) {
					townBoardList = townBoardService.selectNonMemberCtgrTownBoardList(t_ctgr_no, pageno);
					resultMap.put("errorCode",4); 
					resultMap.put("errorMsg", "비회원 카테고리 성공");
					resultMap.put("data", townBoardList);
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		return resultMap;
	}
	
	
	//게시글 사진까지 추가
	@PostMapping(value = "/townboard_write_action_json")
	public Map townBoard_write_action(@RequestParam("files") MultipartFile[] files,@RequestParam Map<String, Object> map, Model model, HttpSession session) throws Exception{
			int code = 0;
			String url = "townBoard_list";
			String message="townBoard_write 실패";
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
				
			
			String sUserId = (String)session.getAttribute("sUserId");
			//map.put("user_id", sUserId);
			Address sAddress = (Address)session.getAttribute("sAddress");
			map.put("address", sAddress);
			
			UserInfo userInfo = new UserInfo(sUserId, sUserId, sUserId, sUserId, null, 0, 0, sUserId, null);
			map.put("userInfo", userInfo);	
			TownCategory townCategory = new TownCategory(Integer.parseInt(map.get("t_ctgr_no").toString()), "");
			map.put("townCategory", townCategory);
			map.put("ImageNameList", fileNames);
			map.remove("t_ctgr_no");
			
			
			
			TownBoard resultList = new TownBoard();
			
			System.out.println("RestController-user_update_profile_json() 호출");
			
			code = townBoardService.insertTownBoard(map);
			if(code==1) message="townBoard_write 성공";
			
			System.out.println("restController>>>"+map);
			
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("message", message);
			resultMap.put("data",resultList);
			
			
			return resultMap;
			
			} catch (Exception e) {
				e.printStackTrace();
				url = "townboard_list";
				message = "Fail to upload files!";
				resultMap.put("message", message);
				resultMap.put("url", url);
				
				//return ResponseEntity.status(HttpStatus.EXPECTATION_FAILED).body(new ResponseMessage(message));
				return resultMap;
			}
			
			}
	
	//게시글 수정
	@PostMapping(value = "/townboard_update_action_json")
	public Map townboard_update_action_json(@RequestParam("files") MultipartFile[] files,@RequestParam Map<String, Object> map,Model model) throws Exception {
		int code = 0;
		String url = "townBoard_list"; //어디로 보내야지?
		String message="townboard_update 실패";
		String newFileName= "";
		int t_no = Integer.parseInt((String) map.get("t_no"));
		int deleteRowCount = townBoardService.deleteTownBoardImgAll(t_no);
		
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
			
			
			
			
			TownCategory townCategory = new TownCategory(Integer.parseInt(map.get("t_ctgr_no").toString()), "");
			map.put("townCategory", townCategory);
			map.put("ImageNameList", fileNames);
			map.remove("t_ctgr_no");
			
			TownBoard resultList = new TownBoard();
			
			code = townBoardService.updateTownBoardOne(map);
			if(code==1) message="townBoard_update 성공";
			
			System.out.println(">>> townboard update "+map);
			url = "redirect:townboard_view_view?t_no"+t_no;
			
			resultMap.put("code", code);
			resultMap.put("url", url);
			resultMap.put("message", message);
			resultMap.put("data",resultList);
			
			
			return resultMap;
			
			} catch (Exception e) {
				e.printStackTrace();
				model.addAttribute("MSG", e.getMessage());
				url = "townboard_list";
				message = "Fail to upload files!";
				resultMap.put("message", message);
				resultMap.put("url", url);
				
				return resultMap;
		}
	}
	
	
	
	
	
	
	
	
	
	//게시글 삭제
	@RequestMapping("/townBoard_delete_rest")
	public Map<String, Object> townBoard_delete_rest(Integer pageno,@RequestParam Integer t_no){
		//String sUserId = (String)session.getAttribute("sUserId");
		Map<String, Object> resultMap = new HashMap<>();
		
		if (pageno == null || t_no == null) {
			resultMap.put("errorCode", -1);
			resultMap.put("errorMsg", "잘못된 접근입니다");
		}
		
		try {
			
			int result = townBoardService.deleteTownBoardOne(t_no);
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
	
	 
	
	//댓글등록
	@PostMapping(value="/townReply_wirte_rest",produces = "application/json;charset=UTF-8")
	public Map<String, Object> townReply_write_action(Integer pageno, @RequestParam Integer t_no, @ModelAttribute TownReply townReply, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		String sUserId = (String)session.getAttribute("sUserId");
		
		try {
			
			townReply.setUserInfo(new UserInfo(sUserId, "", "", "", "", 0, 0, "", null));
			townReply.setTownBoard(new TownBoard(t_no, "", "", "", 0, null, "", 0, 0, null, null, null));
			System.out.println(">>> rest controller: insertTownBoardReply(townReply)호출");
			int result = townReplyService.insertTownBoardReply(townReply);
			
			if (result == 1 ) {
				resultMap.put("errorCode", 1);
				resultMap.put("errorMsg", "댓글을 등록하였습니다");
				
			} else {
				resultMap.put("errorCode", -2);
				resultMap.put("errorMsg", "댓글이 등록되지 않았습니다");
			}
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -3);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		
		return resultMap;
	}
	
	
	//대댓글등록
	@PostMapping(value="/townReReply_wirte_rest",produces = "application/json;charset=UTF-8")
	public Map<String, Object> townReReply_write_action(Integer pageno,@RequestParam Integer t_no, @ModelAttribute TownReply townReply, HttpSession session) {
		Map<String, Object> resultMap = new HashMap<>();
		String sUserId = (String)session.getAttribute("sUserId");
		System.out.println(">>>>>>>>>>> townreply 모든 값"+townReply);
		try {
			//TownReply mainReply = townReplyService.selectTownBoardReplyOne(t_reply_no);
			townReply.setUserInfo(new UserInfo(sUserId, "", "", "", "", 0, 0, "", null));
			townReply.setTownBoard(new TownBoard(t_no, "", "", "", 0, null, "", 0, 0, null, null, null));
			townReply.setGroupno(townReply.getGroupno());
			/*
			townReply.setStep(mainReply.getStep());
			//townReplyService.updateStep(townReply);
			townReply.setDepth(mainReply.getDepth());
			*/
			System.out.println(">>> rest controller: insertTownBoardReply(townReply)호출");
			int result = townReplyService.insertTownBoardReReply(townReply);
			
			if (result == 1 ) {
				resultMap.put("errorCode", 1);
				resultMap.put("errorMsg", "대댓글을 등록하였습니다");
				
			} else {
				resultMap.put("errorCode", -2);
				resultMap.put("errorMsg", "대댓글이 등록되지 않았습니다");
			}
		}catch (Exception e) {
			e.printStackTrace();
			resultMap.put("errorCode", -3);
			resultMap.put("errorMsg", "관리자에게 문의하세요");
		}
		
		return resultMap;
	}
	
	
	//댓글 삭제
		@RequestMapping("/townReply_delete_rest")
		public Map<String, Object> townReply_delete_rest(Integer pageno,Integer t_no,@RequestParam Integer t_reply_no){
			//String sUserId = (String)session.getAttribute("sUserId");
			Map<String, Object> resultMap = new HashMap<>();
			
			if (pageno == null || t_reply_no == null) {
				resultMap.put("errorCode", -1);
				resultMap.put("errorMsg", "잘못된 접근입니다");
			}
			
			try {
				
				int result = townReplyService.deleteTownBoardReply(t_reply_no);
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
