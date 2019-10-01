package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/findpass.do")
public class FindPasswordController extends HttpServlet {
	private UserDAO dao;
	private static String email;
	private static String name;

	public FindPasswordController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User u = new User();
		name = req.getParameter("name");
		email = req.getParameter("email");
		String subject = "[MOMSTUDY] 비밀번호 찾기 인증코드 안내";
		u.setName(name);
		u.setEmail(email);
		System.out.println(name);
		System.out.println(email);

		User user = dao.searchPass(u);

		HttpSession session = req.getSession();
		if (user != null) {
			String keyCode = UUID.randomUUID().toString().replace("-", "");

			User userCode = new User();
			userCode.setName(name);
			userCode.setEmail(email);
			userCode.setCertifiedCode(keyCode);
			session.setAttribute("user", user);

			String url = "http://" + req.getServerName() + ":" + req.getServerPort() + "/" + req.getContextPath()
					+ "/jsp/user/certified.jsp?name=" + name  + "&email=" + email ;

//			String msg = "";
//			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
//			msg += "<h3 style='color: blue;'>비밀번호 찾기 인증코드 입니다.</h3>";
//			msg += "<div style='font-size: 130%'>";
//			msg += "비밀번호 찾기 페이지로 돌아가 인증코드 <strong>";
//			msg += keyCode + "</strong> 를 입력해주세요, </div><br/>";
//			msg += "<div>안증링크 접속하기<div>";
//			msg += "<a href='" + url + "?" + "name=" + name + "&email=" + email + "'>" + url + "</a>";
//			
			String msg = "인증이 완료되었습니다 \n"
					+ "링크를 클릭해 주세요 \n";
			String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
			String us = "네이버 아이디"; // 패스워드 
			String pw = "네이버 비밀번호";      // SMTP 서버 정보를 설정한다. 
			
			Properties props = new Properties(); 
			props.put("mail.smtp.host", host); 
			props.put("mail.smtp.port", 587); 
			props.put("mail.smtp.auth", "true"); 
			
			Session nvSession = Session.getDefaultInstance(props, 
					new javax.mail.Authenticator() { 
				protected PasswordAuthentication getPasswordAuthentication() { 
					return new PasswordAuthentication(us, pw); 
					} 
				}
			); 
			
			try {
				MimeMessage message = new MimeMessage(nvSession); message.setFrom(new InternetAddress(us)); 
				
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); // 메일 제목 
			
				message.setSubject(subject); // 메일 내용
			
				message.setText(msg+url); // send the message 
				
				Transport.send(message); 
			
				System.out.println("Success Message Send"); 
			
			} catch (Exception e) {
				System.out.println("인증번호 전송 실패");
				e.printStackTrace();
			}
		}
		req.getRequestDispatcher("/jsp/user/findform.jsp").forward(req, res);
	}

}
