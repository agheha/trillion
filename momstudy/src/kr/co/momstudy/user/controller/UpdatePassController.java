package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;

@WebServlet("/user/updatepass.do")
public class UpdatePassController extends HttpServlet{
	private UserDAO dao;
	
	public UpdatePassController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		
	}
}