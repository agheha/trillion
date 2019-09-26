package kr.co.momstudy.user.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;

@WebServlet("/user/findpass.do")
public class FindPasswordController extends HttpServlet{
	private UserDAO dao;
	
	public FindPasswordController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
}