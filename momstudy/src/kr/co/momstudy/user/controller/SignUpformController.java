package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Category;

@WebServlet("/user/signupform.do")
public class SignUpformController extends HttpServlet{
	private UserDAO dao;
	
	public SignUpformController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		List<Category> cateList = dao.selectCategory();
		req.setAttribute("cateList",cateList);
		req.getRequestDispatcher("/jsp/user/signupform.jsp").forward(req, res);
	}
}
