package kr.co.momstudy.study.vote.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.VoteCnt;

@WebServlet("/study/revote.do")
public class VoteRetryController extends HttpServlet{
	VoteDAO dao;
	
	public VoteRetryController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		
		int num = Integer.parseInt(req.getParameter("num"));
		VoteCnt vc = new VoteCnt();
		vc.setNum(num);
		vc.setEmail(user.getEmail());
		dao.deleteVoteResultByEmail(vc);
		
		resp.sendRedirect("/momstudy/study/detailvote.do?num=" + num);
	}
	
}
