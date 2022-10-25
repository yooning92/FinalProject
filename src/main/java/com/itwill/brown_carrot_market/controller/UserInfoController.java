package com.itwill.brown_carrot_market.controller;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwill.brown_carrot_market.dto.Address;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.KakaoUserGetService;
import com.itwill.brown_carrot_market.service.KakaoRestJsonService;
import com.itwill.brown_carrot_market.service.UserInfoService;

@Controller
public class UserInfoController {
	@Autowired
	private UserInfoService userService;
	@Autowired
	private KakaoUserGetService kakaoUserGetService;
	@Autowired
	private KakaoRestJsonService kakaoRestJsonService;
	
	@RequestMapping("/user_kakaologin")
	public String user_kakaologin(@RequestParam("code") String code,Model model) throws Exception{
		System.out.println("user_kakaologin_json() - code: "+code);
		
		//access_token이 포함된 JSON String을 받아온다.
        String accessTokenJsonData = kakaoRestJsonService.getAccessTokenJsonData(code);
        if(accessTokenJsonData=="error") return "redirect:user_login";

        //JSON String -> JSON Object
        JSONObject accessTokenJsonObject = new JSONObject(accessTokenJsonData);

        //access_token 추출
        String accessToken = accessTokenJsonObject.get("access_token").toString();
        
        //유저 정보가 포함된 JSON String을 받아온다.
        String userInfo = kakaoUserGetService.getUserInfo(accessToken);
        
        //JSON String -> JSON Object
        JSONObject userInfoJsonObject = new JSONObject(userInfo);
        String id = (String)userInfoJsonObject.get("id").toString();

        //유저의 Email 추출
        JSONObject kakaoAccountJsonObject = (JSONObject)userInfoJsonObject.get("kakao_account");
        String email = kakaoAccountJsonObject.get("email").toString();
        String id_email = email.substring(0,email.indexOf("@"));
        String profile = kakaoAccountJsonObject.get("profile").toString();
        
        JSONObject profileJsonObject = new JSONObject(profile);
        String nickname = profileJsonObject.get("nickname").toString();

        String thumbnail_image_url = profileJsonObject.get("thumbnail_image_url").toString();

        String user_pw = "K"+id+id_email;
        
        UserInfo kakaoUser = new UserInfo();
        kakaoUser.setUser_id(id_email);
        kakaoUser.setUser_name(nickname);
        kakaoUser.setUser_email(email);
        kakaoUser.setUser_profile(thumbnail_image_url);
        kakaoUser.setUser_pw(user_pw);
        
		return "redirect:user_kakaologin_action?"+kakaoUser.toString2();
	}
	
	@RequestMapping(value = "/user_kakaologin_action")
	public String user_kakaologin_action(String user_id, String user_name,String user_email,String user_profile,String user_pw, HttpServletRequest request) throws Exception{
		
		UserInfo userInfo = new UserInfo(user_id, user_pw, user_name, user_email, "010", 0, 0, user_profile, null);
		
		int code=0;
		String url="";
		String msg="";
		Map resultMap=new HashMap();
		List<UserInfo> resultList=new ArrayList<UserInfo>();
		System.out.println("user_kakaologin_action_json - userInfo: "+userInfo);
		
		UserInfo kakaoUser= userService.findUser(userInfo.getUser_id());
		
		if(kakaoUser!=null) {
			request.getSession().setAttribute("sUserId",kakaoUser.getUser_id());
			request.getSession().setAttribute("sUser", kakaoUser);
			if(kakaoUser.getAddressList()!=null) {
				for(Address address: kakaoUser.getAddressList()) {
					if(address.getAddress_range()>0) {
						request.getSession().setAttribute("sAddress", address);
					}
				}
			}
			return "redirect:main";
		}else {	//회원가입
			System.out.println("kakaoUser 회원가입");
			int result= userService.create(userInfo, null, null);
			/*
			 *  0:아이디중복
			 *  1:회원가입성공
			 *  2:초대코드로 회원가입
			 *  3:존재하지 않는 초대코드로 회원가입 
			 */
			if(result!=0) {
				System.out.print("create - result: "+result);
				request.getSession().setAttribute("sUserId",userInfo.getUser_id());
				request.getSession().setAttribute("sUser", userService.findUser(user_id));
				return "redirect:user_my_account";
			}else {
				return "redirect:main";
			}
		}
	}

	@RequestMapping("/user_login")
	public String user_login_form(HttpServletRequest request) {
		String sUserId = (String) request.getSession().getAttribute("sUserId");
		if(sUserId!=null) {
			return "redirect:user_my_account";
		}
		return "user_login";
	}
	
	@LoginCheck
	@RequestMapping(value = "/user_logout_action")
	public String user_logout_action(HttpSession session) {
		session.invalidate();
		return "redirect:main";
	}

	@RequestMapping(value = "/user_login_action", method = RequestMethod.POST)
	public String user_login_action_post(@ModelAttribute(value = "fuser") UserInfo user, HttpServletRequest request)
			throws Exception {
		String forwardPath = "";
		int result = userService.login(user.getUser_id(), user.getUser_pw());
		System.out.println("user_login_action_post호출-result: " + result);
		 //회원로그인 0:아이디존재안함 1:패쓰워드 불일치 2:로그인성공(세션)
		switch (result) {
		case 0:
			request.setAttribute("msg1", user.getUser_id() + " 는 존재하지않는 아이디 입니다.");
			// forwardPath = "user_login_form";
			forwardPath = "user_login";
			break;
		case 1:
			request.setAttribute("msg2", "패쓰워드가 일치하지 않습니다.");
			// forwardPath = "user_login_form";
			forwardPath = "user_login";
			break;
		case 2:
			request.getSession().setAttribute("sUserId", user.getUser_id());
			forwardPath = "redirect:user_my-account";
			break;
		}
		return forwardPath;
	}

	@LoginCheck
	@RequestMapping("/user_my_account")
	public String user_my_account(HttpServletRequest request) throws Exception {
		/************** login check **************/
		System.out.println("기본Controller - user_my_account");
		String sUserId = (String) request.getSession().getAttribute("sUserId");
		if(sUserId!=null) {
			UserInfo sUser = userService.findUser(sUserId);
			request.getSession().setAttribute("sUser", sUser);
	
			System.out.println("sUserId: " + sUserId);
			System.out.println("sUser: " + sUser);
	
			/*********** 수정 필요 ***********/
			if (sUser.getAddressList() != null) {
				for (Address address : sUser.getAddressList()) {
					if (address.getAddress_range() > 0) {
						request.getSession().setAttribute("sAddress", address);
						System.out.println("sAddress : " + address);
					}
				}
			}
			/******************************/
			return "user_my-account";
		}
		return "redirect:main";
	}

	@RequestMapping("/user_find_idpw")
	public String user_find_idpw(HttpServletRequest request) throws Exception {
		return "user_find_idpw";
	}
	
	
/*
	@RequestMapping("/user_write_form")
	public String user_write_form() {
		System.out.println("user_write_form 컨트롤러 호출-userService: " + userService);
		return "user_write_form";
	}
	*/
	
	/*
	 * @LoginCheck
	 * 
	 * @RequestMapping("/user_view") public String user_view(HttpServletRequest
	 * request) throws Exception{
	 * 
	 * String sUserId=(String)request.getSession().getAttribute("sUserId"); UserInfo
	 * loginUser=userService.findUser(sUserId); request.setAttribute("loginUser",
	 * loginUser); return "user_view"; }
	 * 
	 * @LoginCheck
	 * 
	 * @RequestMapping(value = "/user_modify_form",method=RequestMethod.POST) public
	 * String user_modify_form_post(HttpServletRequest request)throws Exception {
	 * 
	 * String sUserId=(String)request.getSession().getAttribute("sUserId"); UserInfo
	 * loginUser=userService.findUser(sUserId); request.setAttribute("loginUser",
	 * loginUser); return "user_modify_form"; }
	 * 
	 * @LoginCheck
	 * 
	 * @RequestMapping(value = "/user_modify_action",method = RequestMethod.POST)
	 * public String user_modify_action_post(@ModelAttribute UserInfo user) throws
	 * Exception{ int rowCount=userService.update(user); return
	 * "redirect:user_view"; }
	 * 
	 * @LoginCheck
	 * 
	 * @RequestMapping(value = "/user_remove_action",method = RequestMethod.POST)
	 * public String user_remove_action_post(HttpSession session) throws Exception{
	 * String sUserId=(String)session.getAttribute("sUserId"); int
	 * rowCount=userService.remove(sUserId); session.invalidate(); return
	 * "redirect:user_main"; }
	 */

	@RequestMapping(value = { "/user_modify_form",
			/* "/user_login_action", */
			/* "/user_my_account", */
			"/user_write_action", "/user_modify_action", "/user_remove_action" }, method = RequestMethod.GET)
	public String user_action_get() {
		return "redirect:main";
	}

	@ExceptionHandler(Exception.class)
	public String handle_exception(Exception e) {
		return "user_error";
	}

}