package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {
	private UserDAO dao;
	
	public LoginController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User u = new User();
		u.setEmail(req.getParameter("email"));
		u.setPass(req.getParameter("pass"));
		User user = dao.selectLogin(u);
		
		if (user == null) {
			res.sendRedirect("loginform.do");
			return;
		}
		
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		res.sendRedirect(req.getContextPath() + "/main.do");
		
		
	}
}
