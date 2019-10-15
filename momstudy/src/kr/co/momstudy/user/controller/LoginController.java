package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

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
		System.out.println(user);
		PrintWriter out = res.getWriter();
		if (user != null) {
			if(user.getStatus() == 2 ) {
				out.println(new Gson().toJson(user));
				out.close();
				return;
			} else {
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				out.println(new Gson().toJson(user));
				out.close();
			}
		} else {
			out.println(new Gson().toJson(user));
			out.close();
		}
	}
}
