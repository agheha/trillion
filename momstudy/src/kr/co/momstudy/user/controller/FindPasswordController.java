package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;

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
		PrintWriter out = res.getWriter();

		User user = dao.searchPass(u);
		out.println(new Gson().toJson(user));
		out.close();

		if (user != null) {
			String keyCode = UUID.randomUUID().toString().replace("-", "");

			User userCode = new User();
			userCode.setName(name);
			userCode.setEmail(email);
			userCode.setCertifiedCode(keyCode);
			req.getSession().setAttribute("user", user);

			String url = "http://" + req.getServerName() + ":" + req.getServerPort() + "/" + req.getContextPath()
					+ "/user/certified.do?name=" + name  + "&email=" + email ;

			String msg = "인증이 완료되었습니다 \n"
					+ "링크를 클릭해 주세요 \n";
			String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정 
			final String us = ""; // 패스워드 
			final String pw = "";      // SMTP 서버 정보를 설정한다. 
			
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
