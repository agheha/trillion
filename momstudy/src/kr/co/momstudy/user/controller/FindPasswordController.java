package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/findpass.do")
public class FindPasswordController extends HttpServlet{
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
		
		User  user = dao.searchPass(u);
		
		HttpSession session = req.getSession();
		if (user != null) {
			String keyCode = UUID.randomUUID().toString();
			
			User userCode = new User();
			userCode.setName(name);
			userCode.setEmail(email);
			userCode.setCertifiedCode(keyCode);
			session.setAttribute("user", user);
			
			String url = req.getServerName() + ":" + req.getServerPort() + "/" + req.getContextPath() + "/jsp/user/certified.jsp";
			
			String msg = "";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>비밀번호 찾기 인증코드 입니다.</h3>";
			msg +="<div style='font-size: 130%'>";
			msg +="비밀번호 찾기 페이지로 돌아가 인증코드 <strong>";
			msg += keyCode + "</strong> 를 입력해주세요, </div><br/>";
			msg += "<div>안증링크 접속하기<div>";
			msg += "<a href='" + url + "?" + "name=" + name + "&email" +email +"'>"+url+"</a>" ;
			try {
				sendMail(email, subject, msg);
			} catch (Exception e) {
				System.out.println("인증번호 전송 실패");
				e.printStackTrace();
			}
		}
		req.getRequestDispatcher("/jsp/user/findform.jsp").forward(req, res);
	}
	
	
	public static void sendMail(String email, String subject, String msg) throws Exception {
		//Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "네이버아이디"; 
		String hostSMTPpwd = "네이버 비밀번호";
		
		//보내는 사람
		String fromEmail= email;
		String fromName = name;
				
		//email 전송
		try {
			HtmlEmail mail = new HtmlEmail();
			mail.setDebug(true);
			mail.setCharset(charSet);
			mail.setSSLOnConnect(true);
			//SSL 사용 (TLS가 없는 경우 SSL사용)
			mail.setHostName(hostSMTP);
			mail.setSmtpPort(587);
			//SMTP 포트 번호
			mail.setAuthentication(hostSMTPid, hostSMTPpwd);
			mail.setStartTLSEnabled(true); // TLS 사용
			mail.addTo(email, name);
			mail.setFrom(fromEmail, fromName, charSet);
			mail.setSubject(subject);
			mail.setHtmlMsg(msg);
			mail.send();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
