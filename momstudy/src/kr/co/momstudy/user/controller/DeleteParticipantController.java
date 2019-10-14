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

@WebServlet("/user/delparticipant.do")
public class DeleteParticipantController extends HttpServlet {
	private UserDAO dao;
	
	public DeleteParticipantController() {
		this.dao= MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String[] delList = req.getParameterValues("chk");
		
		
		PrintWriter out = res.getWriter();
		out.println();
		out.close();
	}
}