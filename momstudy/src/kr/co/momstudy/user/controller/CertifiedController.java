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
		
		HttpSession session = req.getSession();
		if (session == null) {
			res.sendRedirect(req.getContextPath() + "");
		}
		User user = dao.selectFindLogin(u.getEmail());
		session.setAttribute("user", user);
		req.getRequestDispatcher("/jsp/user/updatepass.jsp").forward(req, res);
	}
}
