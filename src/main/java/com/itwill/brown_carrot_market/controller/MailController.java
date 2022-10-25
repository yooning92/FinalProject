package com.itwill.brown_carrot_market.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.itwill.brown_carrot_market.dto.Invitation;
import com.itwill.brown_carrot_market.dto.UserInfo;
import com.itwill.brown_carrot_market.service.MailService;


@RestController
public class MailController {
	@Autowired
	private MailService mailService;
	
	//[마이페이지]초대코드 발송
	@PostMapping(value="springMail", produces = "application/json;charset=UTF-8")
	public Map mailSener(HttpServletRequest request, Invitation invitation) throws Exception{
		
		System.out.println("controller에서 param>>>"+invitation);
		
		Map resultMap=new HashMap();
		int code=2;
		String url="";
		String msg="";
		boolean b=false;
		
		String sUserId=(String)request.getSession().getAttribute("sUserId");
		invitation.setUser_id(sUserId);
		
		try {
			code=1;
			url="";
			msg="";
			b=mailService.mailsender(invitation);
		} catch (Exception e) {
			code=2;
			url="";
			msg="메일 실패";
			e.printStackTrace();
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",b);
		
		return resultMap;
	}

	//[비밀번호찾기]임시비밀번호 발송
	@PostMapping(value="springMail/findPw", produces = "application/json;charset=UTF-8")
	public Map mailSenerfindPw(HttpServletRequest request, UserInfo userInfo) throws Exception{
		
		System.out.println("controller에서 param>>>"+userInfo);
		
		Map resultMap=new HashMap();
		int code=2;
		String url="springMail/findPw";
		String msg="springMail/findPw 실패";
		boolean b=false;
		
		try {
			code=1;
			url="";
			msg="";
			b=mailService.mailsenderFindPw(userInfo);
		} catch (Exception e) {
			code=2;
			url="";
			msg="springMail/findPw메일 실패";
			e.printStackTrace();
		}
		resultMap.put("code", code);
		resultMap.put("url", url);
		resultMap.put("msg", msg);
		resultMap.put("data",b);
		
		return resultMap;
	}
	/*
	@PostMapping(value="contact")
	public String mailSender() throws AddressException, MessagingException {

		// naver smtp server를 사용한다.
		String host = "smtp.naver.com";

		// naver smtp port
		int port = 465;

		// 발신자의 메일 주소
		String username = "leehee235@naver.com";

		// 발신자의 PASSWORD
		final String password = "2799047Nnn";

		// 수신자의 메일 주소
		String recipient = "jjushine24@naver.com";

		// 수신자에게 보낼 메일 제목
		String subject = "Mail test";

		// 수신자에게 보낼 메일 내용
		String contents = "내용~~~~";

		// SMTP 서버 설정 정보 세팅
		//Properties props = System.getProperties();
		Properties props=new Properties();
		// smtp 서버
		props.put("mail.smtp.host", host);
		// smtp 포트
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.trust", host);

			// Session 생성 & 발신자 smtp 서버 로그인 인증
			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(username, password);
				}
			});

			//session.setDebug(true); // 디버그 모드

			// MimeMessage 생성 & 메일 세팅
			Message mimeMessage = new MimeMessage(session);
			try {
			mimeMessage.setFrom(new InternetAddress(username)); // 발신자
			//mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); // 수신자

			// 여러사람에게 메일을 보내고 싶을때?
			// InternetAddress[] addArray = new InternetAddress[3];
			// addArray[0] = new InternetAddress("aaa@aaa.aaa");
			// addArray[1] = new InternetAddress("bbb@bbb.bbb");
			// addArray[2] = new InternetAddress("ccc@ccc.ccc");
			// message.addRecipients(Message.RecipientType.TO, addArray);

			mimeMessage.setSubject(subject); // 제목
			//mimeMessage.setText(contents); // 내용
			mimeMessage.setContent(contents,"text/html;charset=UTF-8"); // 내용

			// 평서문이 아닌 html 태그를 보내고 싶다면?
			// mimeMessage.setContent("<h1>안녕하세용?</h1>","text/html; charset=UTF-8")

			Transport.send(mimeMessage); // 전송
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "index";
	}
	*/
}
