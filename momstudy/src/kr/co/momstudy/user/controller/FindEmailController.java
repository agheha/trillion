package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.PhoneNumformat;

@WebServlet("/user/findemail.do")
public class FindEmailController extends HttpServlet{
	private UserDAO dao;
	
	public FindEmailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User u = new User();
		u.setName(req.getParameter("name"));
		System.out.println(PhoneNumformat.phone(req.getParameter("phnum")));
		u.setPhoneNum(PhoneNumformat.phone(req.getParameter("phnum")));
		String email = dao.searchEmail(u);
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(email));
		out.close();
	}
}