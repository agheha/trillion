package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/delparticipant.do")
public class DeleteParticipantController extends HttpServlet {
	private UserDAO dao;
	
	public DeleteParticipantController() {
		this.dao= MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		Participant part = new Participant();
		part.setEmail(user.getEmail());
		part.setNum(Integer.parseInt(req.getParameter("parcancell")));
		dao.deleteParticipant(part);
	}
}