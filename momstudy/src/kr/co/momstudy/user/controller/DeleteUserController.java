package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/deleteuser.do")
public class DeleteUserController extends HttpServlet{
	private UserDAO dao;
	
	public DeleteUserController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		dao.deleteUser(user.getEmail());
		req.getSession().invalidate();
		res.sendRedirect(req.getContextPath() + "/jsp/user/withdrawal.jsp");
	}
}