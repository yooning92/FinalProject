package com.itwill.brown_carrot_market.service;

import org.springframework.mail.javamail.JavaMailSender;

import com.itwill.brown_carrot_market.dto.Invitation;
import com.itwill.brown_carrot_market.dto.UserInfo;

public interface MailService {
	
	boolean mailsender(Invitation invitation) throws Exception;

	boolean mailsenderFindPw(UserInfo userInfo) throws Exception;
}
