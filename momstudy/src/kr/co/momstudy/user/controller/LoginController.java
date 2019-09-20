package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.user.dao.UserDAO;
import kr.co.momstudy.user.vo.User;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {
	private UserDAO dao;
	
	public LoginController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = new User();
		user.setEmail(req.getParameter("email"));
		user.setPass(req.getParameter("pass"));
		user.setName(req.getParameter("name"));
		dao.selectLogin(user);
				
				
		HttpSession session = req.getSession();
		
	}
}
