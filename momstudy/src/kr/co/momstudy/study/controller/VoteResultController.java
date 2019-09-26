package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.Vote;
import kr.co.momstudy.repository.vo.VoteAricle;

@WebServlet("/study/voteresult.do")
public class VoteResultController extends HttpServlet{
		VoteDAO dao;
		
		
	public VoteResultController() {
			this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
		}


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("num"));
		Vote vote = dao.selectOneVote(num);
		int voteCnt = dao.selectVoteResultCnt(vote.getNum());
		List<VoteAricle> valist = dao.selectVoteAricle(num);
		req.setAttribute("vote", vote);
		req.setAttribute("valist", valist);
		req.setAttribute("voteCnt", voteCnt);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/voteresult.jsp");
		rd.forward(req, res);
	}
	
}
