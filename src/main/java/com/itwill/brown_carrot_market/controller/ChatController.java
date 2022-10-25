package com.itwill.brown_carrot_market.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwill.brown_carrot_market.dto.ChatContents;
import com.itwill.brown_carrot_market.dto.ChatRoom;
import com.itwill.brown_carrot_market.dto.ChatRoomListView;
import com.itwill.brown_carrot_market.dto.ProductImage;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.ChatService;
import com.itwill.brown_carrot_market.service.ProductService;
import com.itwill.brown_carrot_market.service.UserInfoService;




@Controller
public class ChatController {
	
	@Autowired private ChatService chatService;
	@Autowired private UserInfoService userInfoService;
	@Autowired private ProductService productService;
	
	/**************************************************/
		//@RequestMapping(value="/chat_room", method=RequestMethod.POST)
		public String chatList(HttpSession httpSession,@RequestParam String user) {
			List<ChatRoomListView> chatList = chatService.chatRoomSelectAll(user);

			httpSession.setAttribute("chatList",chatList);
			httpSession.setAttribute("loginId", user);
			return "chat_room";
		}	
		 
		
		//@RequestMapping(value = "/login", method = { RequestMethod.GET })
		public String login(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
			return "login";
		}
		
		/************약속잡기*************/
		@RequestMapping(value="/chat_appointment",method=RequestMethod.GET)
		public String chatAppointment(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		return "chat_appointment";	
		}
		
		@RequestMapping(value="/chat_appointment_change",method=RequestMethod.GET)
		public String chatAppointmentChange(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		return "chat_appointment_change";	
		}
		
		@RequestMapping(value="/chat_appointment_map",method=RequestMethod.GET)
		public String chatAppointmentMap(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		return "chat_appointment_map";	
		}
		
		/***faq****/
		
		@RequestMapping(value="/faq",method=RequestMethod.GET)
		public String faq(HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		return "faq";	
		}
		
		/**************************************************/
		@RequestMapping(value="/chat_room", method=RequestMethod.GET)
		public String chatList(HttpSession httpSession,Model model) throws Exception {
			
			String userId=(String)httpSession.getAttribute("sUserId");
			UserInfo userInfo=(UserInfo) httpSession.getAttribute("sUser");
				//System.out.println("************************** 아이디 :"+userId);
			  List<ChatRoomListView> chatList = chatService.chatRoomSelectAll(userId);
			  System.out.println(chatList);
				for (ChatRoomListView chatRoomListView : chatList) {
						
						System.out.println(chatRoomListView.getYou_id());
					
						String img = userInfoService.findUser(chatRoomListView.getYou_id()).getUser_profile();
						ArrayList<ProductImage> productImage = (ArrayList<ProductImage>)productService.selectProductImgList(chatRoomListView.getP_no());
						if(productImage.size()==0) {
							chatRoomListView.setP_img("close.png");
						}else {
							chatRoomListView.setP_img(productImage.get(0).getPi_name());
							
						}
						System.out.println(chatRoomListView.getP_img());
						chatRoomListView.setYou_image(img);
						
						chatRoomListView.setNot_read(chatService.chatNotRead(chatRoomListView.getC_room_no(), userId));
						if(chatRoomListView.getC_content().startsWith("@@image!#")) {
							chatRoomListView.setC_content("사진 전송");
						}
				}
			  System.out.println("채팅 리스트:"+chatList);
			  model.addAttribute("chatList",chatList);
			  //드롭다운 채팅 클릭으로 채팅사이트 이동 
			  model.addAttribute("path",1);
			  httpSession.setAttribute("loginId", userId);
			  
			 
			return "chat_room";
		}	
		/************************************채팅방 생성*************************************/
		@RequestMapping(value="/create_room", method=RequestMethod.POST)
		public String chatCreate(HttpSession httpSession,@RequestParam("p_no") int p_no,Model model) throws Exception{
			String from_id = (String)httpSession.getAttribute("sUserId");
			String to_id = productService.selectByOne(p_no).getUserInfo().getUser_id();
			int chat_room_no =0;
			boolean check = chatService.duplicateCheck(from_id, to_id, p_no);
			if(check) {
				System.out.println("채팅방이 이미 존재합니다");
				chat_room_no = chatService.chatRoomSearch(from_id, to_id,p_no);
			}else {
				chatService.chatRoomCreate(from_id, to_id, p_no);
				
				chat_room_no = chatService.chatRoomSearch(from_id, to_id,p_no);
				String admin = "admin";
				ChatContents newChat=new ChatContents(0, "사기, 불법거래에 주의하세요.",
						null, null, admin, chat_room_no);
				chatService.insertChat(newChat);
			}
			List<ChatRoomListView> chatList = chatService.chatRoomSelectAll(from_id);
			for (ChatRoomListView chatRoomListView : chatList) {
				
				System.out.println(chatRoomListView.getYou_id());
			
				ArrayList<ProductImage> productImage = (ArrayList<ProductImage>)productService.selectProductImgList(chatRoomListView.getP_no());
				if(productImage.size()==0) {
					chatRoomListView.setP_img("close.png");
				}else {
					chatRoomListView.setP_img(productImage.get(0).getPi_name());
					
				}
				
				
				String img = userInfoService.findUser(chatRoomListView.getYou_id()).getUser_profile();
				chatRoomListView.setYou_image(img);
				chatRoomListView.setNot_read(chatService.chatNotRead(chatRoomListView.getC_room_no(), from_id));
		}
			model.addAttribute("chatList",chatList);
			//채팅방 생성으로 채팅사이트 이동 
			model.addAttribute("path",2);
			model.addAttribute("chat_room_no",chat_room_no);
			httpSession.setAttribute("loginId", from_id);
			return "chat_room";
		}	
		
		
		

	/**************************************************/
		
	/**************************************************/
	
	@RequestMapping(value = "/chat", method = { RequestMethod.GET })
	public String chat(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "chat";
	}
	
	@RequestMapping(value = "/chat_content", method = { RequestMethod.GET })
	public String chat_content(HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "chat_content";
	}
	
	@ResponseBody
	   @RequestMapping(value = "/sessionCheck", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	   public String returnSessionCheck(HttpSession httpSession) {
	      String mId = (String)httpSession.getAttribute("mId"); // 아이디 얻기 
			/*
			 * Map<String, Member> memberInfo = dmService.getMemberInfo(mId); String mImage
			 * = memberInfo.get("member").getmImage(); String mName =
			 * memberInfo.get("member").getmName();
			 */
	      String mName="닉네임";
	      return mId+","+mName;
	   }
	
	//채팅방의 저장되어있던 데이터  
	
	@ResponseBody
	@GetMapping(value="/chat_detail")
	public List<ChatContents> chatDetail (@RequestParam("c_room_no") int c_room_no){
		List<ChatContents> chatDetailList=chatService.chatSellectByRoom(c_room_no);
		return chatDetailList;
	}
	

	
	
	//읽음(1)으로 변경
	/*
	 * @ResponseBody
	 * 
	 * @GetMapping(value="/chat_readUpdate") public int
	 * chatReadUpdate(@RequestParam("c_room_no") int c_room_no) { return
	 * chatService.chatReadUpdate(c_room_no); }
	 */
	
	//메세지 삭제
	@ResponseBody
	@PostMapping(value="/chat_delete")
	public int chatDelete(@RequestParam("c_content_no") int c_content_no) {
		return chatService.chatDelete(c_content_no);
	}
	
	
	//메세지 전송 
	@ResponseBody
	@PostMapping(value="/chat_message")
	public String insertChat(@RequestBody Map<String,String> messages) {
		int rowCount=0;
		ChatContents newChat=new ChatContents(0, String.valueOf(messages.get("contents")),
				null, null, String.valueOf(messages.get("mId")), 
				Integer.valueOf(messages.get("c_room_no")));
		rowCount=chatService.insertChat(
					newChat
				);
		
		//insert 후  클라이언트에게 jsonObject  만들어서 보내기 
		
		JSONObject jsonObject=null;
		try {
			jsonObject=new JSONObject();
			jsonObject.put("mId", String.valueOf(messages.get("mId")));
			jsonObject.put("yourId", String.valueOf(messages.get("yourId")));
			jsonObject.put("contents", String.valueOf(messages.get("contents")));
			jsonObject.put("sendtime",chatService.chatSellectOne(newChat.getC_content_no()).getSend_time() );
			jsonObject.put("c_room_no", String.valueOf(messages.get("c_room_no")));
			jsonObject.put("chat_read", String.valueOf(messages.get("chat_read")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonObject.toString();
				
		
	}
	
	/*
	 * // [post body json : Map 방식]
    // [경로 지정 : http://localhost:7000/testPostBodyJson]
    // [body json 데이터 : {"idx":"1", "name":"투케이"}]
    @PostMapping("/testPostBodyJson")
    public String testPostBodyJson(@RequestBody Map<String, String> param) {
        System.out.println("\n");
        System.out.println("=======================================");
        System.out.println("[ModuleApiController] : [testPostBodyJson] : [start]");
        System.out.println("[request keySet] : " + String.valueOf(param.keySet()));
        System.out.println("[request idx] : " + String.valueOf(param.get("idx")));
        System.out.println("[request name] : " + String.valueOf(param.get("name")));
        System.out.println("=======================================");
        System.out.println("\n");

        // 리턴을 반환할 JSON 데이터 생성 실시
        JSONObject jsonObject = null;
        try {
            jsonObject = new JSONObject();
            jsonObject.put("idx", String.valueOf(param.get("idx")));
            jsonObject.put("name", String.valueOf(param.get("name")));
        }
        catch (Exception e){
            e.printStackTrace();
        }

        // return 리턴 데이터 반환 [json 형식]
        return jsonObject.toString();
    }
	 */
	@RequestMapping(value="/change_product_state", method=RequestMethod.GET)
	public String change_product_state(HttpSession httpSession,Model model,@RequestParam(value = "p_no")int p_no,@RequestParam(value = "user_id")String user_id) throws Exception {
		System.out.println("--------------------------------------------");
		System.out.println(p_no);
		System.out.println(user_id);

		List<ChatRoomListView> userList =chatService.chatListUsers(p_no, user_id);
		System.out.println(userList);
		for (ChatRoomListView chatRoomListView : userList) {
			
		
			String img = userInfoService.findUser(chatRoomListView.getYou_id()).getUser_profile();
			double fresh = 	userInfoService.findUser(chatRoomListView.getYou_id()).getUser_freshness();
			chatRoomListView.setYou_image(img);
			chatRoomListView.setYou_fresh(fresh);
			
			

	}
		
		model.addAttribute("userList",userList);
		model.addAttribute("p_no",p_no);
		model.addAttribute("user_id",user_id);
		
	return "change_product_state";
	}
	
	
	

}
