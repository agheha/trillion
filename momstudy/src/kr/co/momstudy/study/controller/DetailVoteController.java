package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.Vote;
import kr.co.momstudy.repository.vo.VoteAricle;
import kr.co.momstudy.repository.vo.VoteCnt;

@WebServlet("/study/detailvote.do")
public class DetailVoteController extends HttpServlet{
		VoteDAO dao;
		
		
	public DetailVoteController() {
			this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
		}


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		
		VoteCnt vc = new  VoteCnt();
		int num = Integer.parseInt(req.getParameter("num"));
		Vote vote = dao.selectOneVote(num);
		int cnt = dao.selectVoteResultCnt(num);
		
		
		vc.setEmail(user.getEmail());
		vc.setNum(vote.getNum());
		if(dao.selectCheckResult(vc) > 0) {
			res.sendRedirect("/momstudy/study/voteresult.do?num=" + vote.getNum() );
			return;
		}
		
		
		List<VoteAricle> valist = dao.selectVoteAricle(num);
		req.setAttribute("vote", vote);
		req.setAttribute("valist", valist);
		req.setAttribute("cnt", cnt);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/voteform.jsp");
		rd.forward(req, res);
	}
	
}
