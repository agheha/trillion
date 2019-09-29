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
import kr.co.momstudy.util.PhoneNumformat;

@WebServlet("/user/findemail.do")
public class FindEmailController extends HttpServlet{
	private UserDAO dao;
	
	public FindEmailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String  result = "succese";
		User u = new User();
		u.setName(req.getParameter("name"));
		u.setPhoneNum(PhoneNumformat.phone(req.getParameter("phnum")));
		User user = dao.searchEmail(u);
		if (user == null) {
			result = "fail";
		}
		req.setAttribute("user", user);
		req.getRequestDispatcher("/jsp/user/findform.jsp").forward(req, res);
	}
}