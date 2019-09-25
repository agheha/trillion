package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.UserCategory;

@WebServlet("/user/signup.do")
public class SignUpController extends HttpServlet{
	private UserDAO dao;
	public SignUpController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String pass1 = req.getParameter("pass1");
		String pass2 = req.getParameter("pass2");
		String name = req.getParameter("name");
		String phoneNum = req.getParameter("phnum");
		String birDate = req.getParameter("year") +"-"+ req.getParameter("month") +"-"+ req.getParameter("date");
		String gender = req.getParameter("gender");
		String[] category = req.getParameterValues("category");
		String page= "";
		if (!pass1.equals(pass2)) res.sendRedirect(req.getContextPath() + "/user/signupform.do?fail=0");			
		
		Date birth = null;
		try {
			birth = new SimpleDateFormat("yyyy-MM-dd").parse(birDate);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

		User user = new User();
		user.setEmail(email);
		user.setPass(pass1);
		user.setName(name);
		user.setPhoneNum(phoneNum);
		user.setBirth(birth);
		user.setGender(gender);
		for (String val : category) {
			UserCategory userCategory = new UserCategory();
			userCategory.setEmail(email);
			userCategory.setCategoryCode(Integer.parseInt(val));
			
		}
		dao.insertUser(user);
	
		
		res.sendRedirect(req.getContextPath() + "/main.do");			
		
		
		
	}
}
