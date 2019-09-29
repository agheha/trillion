package kr.co.momstudy.study.vote.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;

@WebServlet("/study/deletevote.do")
public class DeleteVoteController extends HttpServlet{
	VoteDAO dao;		
	
	public DeleteVoteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		dao.deleteVote(num);
		resp.sendRedirect(req.getContextPath() + "/study/votelist.do");
	}

}
