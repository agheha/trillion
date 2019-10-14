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
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/participant.do")
public class ParticipantController extends HttpServlet {
	private UserDAO dao;
	
	public ParticipantController() {
		this.dao= MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		
		List<Participant> parList = dao.selectParticipant(user.getEmail());
		
		req.setAttribute("parlist", parList);
		req.getRequestDispatcher("/jsp/user/participant.jsp").forward(req, res);
	}
}
