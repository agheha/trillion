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

@WebServlet("/user/certified.do")
public class CertifiedController extends HttpServlet {
	private UserDAO dao;
	
	public CertifiedController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		User u = new User();
		u.setEmail(req.getParameter("email"));
		u.setName(req.getParameter("name"));
		
		User user = dao.selectFindLogin(u);
		System.out.println(user);
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		req.getRequestDispatcher("/user/updatepass.do").forward(req, res);
	}
}
