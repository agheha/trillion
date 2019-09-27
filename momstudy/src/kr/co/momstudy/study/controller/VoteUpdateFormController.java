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
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.Vote;
import kr.co.momstudy.repository.vo.VoteAricle;
import kr.co.momstudy.repository.vo.VoteCnt;

@WebServlet("/study/voteupdateform.do")
public class VoteUpdateFormController extends HttpServlet {
	VoteDAO dao;
	
	public VoteUpdateFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		Vote vote = dao.selectOneVote(num);
		User user = (User)req.getAttribute("user");
		VoteCnt vc = new VoteCnt();
		vc.setNum(num);
		vc.setEmail(user.getEmail());
		List<VoteAricle> valist = dao.selectVoteAricle(vc);
		req.setAttribute("vote", vote);
		req.setAttribute("valist", valist);
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/voteupdateform.jsp");
		rd.forward(req, res);
	}
	
}
