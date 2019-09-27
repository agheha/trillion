package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/findpass.do")
public class FindPasswordController extends HttpServlet{
	private UserDAO dao;
	
	public FindPasswordController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User u = new User();
		u.setName(req.getParameter("name"));
		u.setEmail(req.getParameter("email"));
		
		User  user = dao.searchPass(u);
		if (user == null) {
			user = null;
		}
	}
	
	
	HtmlEmail mail = new HtmlEmail();
	
}