package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/passchk.do")
public class PassCheck extends HttpServlet{
	private UserDAO dao;
	
	public PassCheck() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=utf-8");
		User u = (User)req.getSession().getAttribute("user");
		User user = new User();
		user.setEmail(u.getEmail());
		user.setPass(req.getParameter("pass"));
		int chk = dao.passCheck(user);
		PrintWriter out = res.getWriter();
		out.println(chk);
		out.close();
	}
	
	
}
