package com.itwill.brown_carrot_market.service;

import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.itwill.brown_carrot_market.dao.UserInfoDao;
import com.itwill.brown_carrot_market.dto.Invitation;
import com.itwill.brown_carrot_market.dto.UserInfo;

@Service
public class MailServiceImpl implements MailService {
	
	@Autowired
	@Qualifier("userDaoImpl")
	private UserInfoDao userDao;

	@Override
	public boolean mailsender(Invitation invitation) throws Exception {

		String invi_code = RandomString();
		
		boolean b = false;
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		String id = "browncarrotmarket@gmail.com";
		String passwd = "ltxxmvgyzxwwfgpc";

		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername(id);
		sender.setPassword(passwd);
		sender.setDefaultEncoding("UTF-8");
		Properties javaMailProperties = new Properties();
		javaMailProperties.put("mail.smtp.auth", true);
		javaMailProperties.put("mail.smtp.starttls.enable", true);

		/*
		 * javaMailProperties.put("mail.smtp.ssl.enable", true);
		 * javaMailProperties.put("mail.smtp.ssl.trust","smtp.gmail.com" );
		 */
		sender.setJavaMailProperties(javaMailProperties);

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(invitation.getInvi_email())); // 수신 메일
				mimeMessage.setSubject("[흙당근 마켓] " + invitation.getUser_id() + " 님이 초대장을 보냈습니다.", "UTF-8");
				//mimeMessage.setText("흙당근 마켓에" + invitation.getUser_id() + "님이 초대합니다.\n초대코드: "+invi_code+"\n http://localhost/brown_carrot_market/main","UTF-8");
				mimeMessage.setContent( "<div class=\"\" style=\"text-align:center\">\r\n"
						+ "		             <h3 id=\"title\">흙당근 마켓으로" + invitation.getUser_id() + "님이 초대합니다.</h3>\r\n"
						+ "		             <p class=\"mb-0\" id=\"body1\" >초대코드: "+invi_code+"</p>"
						+ "		             <p class=\"mb-0\" id=\"body2\" style=\"color:dimgray\">초대코드로 회원가입하시면, 500point를 드립니다!</p>\r\n http://119.207.178.242/brown_carrot_market/main"
						+ "		         </div>\r\n"
						, "text/html; charset=utf-8");
			}
		};
		try {
			sender.send(preparator);
			invitation.setInvi_email(invi_code);
			userDao.createInvitation(invitation);
			b = true;
		} catch (MailException mex) {
			System.out.println(mex.getMessage());
		}
		return b;
	}
	
	@Override
	public boolean mailsenderFindPw(UserInfo userInfo) throws Exception {
		
		String newPw = RandomString();
		
		boolean b = false;
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		String id = "browncarrotmarket@gmail.com";
		String passwd = "ltxxmvgyzxwwfgpc";

		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername(id);
		sender.setPassword(passwd);
		sender.setDefaultEncoding("UTF-8");
		Properties javaMailProperties = new Properties();
		javaMailProperties.put("mail.smtp.auth", true);
		javaMailProperties.put("mail.smtp.starttls.enable", true);

		/*
		 * javaMailProperties.put("mail.smtp.ssl.enable", true);
		 * javaMailProperties.put("mail.smtp.ssl.trust","smtp.gmail.com" );
		 */
		sender.setJavaMailProperties(javaMailProperties);

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(userInfo.getUser_email())); // 수신 메일
				mimeMessage.setSubject("[흙당근마켓]홈페이지 임시비밀번호를 안내 해드립니다.", "UTF-8");
				//mimeMessage.setText(userInfo.getUser_id()+" 회원님, 흙당근마켓 임시비밀번호를 안내해드립니다.\n임시로 발급 받으신 비밀번호로 로그인한 후, 새로운 비밀번호로 변경하시기 바랍니다.\n임시비밀번호 : "+newPw+"\n http://localhost/brown_carrot_market/user_login", "UTF-8");
				mimeMessage.setContent( "<div class=\"\" style=\"text-align:center\">\r\n"
						+ "		             <h3 id=\"title\">"+userInfo.getUser_id()+" 회원님, 흙당근마켓 임시비밀번호를 안내해드립니다.</h3>\r\n"
						+ "		             <p class=\"mb-0\" id=\"body1\" >임시비밀번호 : "+newPw+"</p>"
						+ "		             <p class=\"mb-0\" id=\"body2\" style=\"color:dimgray\">임시로 발급 받으신 비밀번호로 로그인한 후, 새로운 비밀번호로 변경하시기 바랍니다.</p>\r\n http://119.207.178.242/brown_carrot_market/user_login"
						+ "		         </div>\r\n"
						, "text/html; charset=utf-8");
			}
		}; 
		try {
			sender.send(preparator);
			//메일이 성공적으로 보내지면, UPDATE user_pw
			userInfo.setUser_pw(newPw);
			userDao.updatePwById(userInfo);
			
			b = true;
		} catch (MailException mex) {
			System.out.println(mex.getMessage());
		}
		return b;
	}
	
	//create-randomString
	public static String RandomString() {
		
		int leftLimit = 48; //numeral '0'
		int rightLimit = 122; //letter 'z'
		int targetStringLength = 10;
		
		Random random = new Random();
		String generateString =
			random.ints(leftLimit, rightLimit+1)
			.filter(i ->(i<=57||i>=65)&&(i<=90||i>97))
			.limit(targetStringLength)
			.collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
			.toString()
			;
		return generateString;
	}

}
