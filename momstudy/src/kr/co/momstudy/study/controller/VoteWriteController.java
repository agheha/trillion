package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.Vote;
import kr.co.momstudy.repository.vo.VoteAricle;

@WebServlet("/study/votewrite.do")
public class VoteWriteController extends HttpServlet{
	VoteDAO dao;
	public VoteWriteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Enumeration<String> names = req.getParameterNames();
		int duplication = 1;
		int anonumous= 1;
		int ariclePlus = 1;
		String title = req.getParameter("title");
		if(("on".equalsIgnoreCase(req.getParameter("duplication")))) duplication = 2;
		if("on".equalsIgnoreCase(req.getParameter("anonumous"))) anonumous = 2;
		if("on".equalsIgnoreCase(req.getParameter("ariclePlus"))) ariclePlus = 2;
		
		Vote vote = new Vote();
		vote.setAnonumous(anonumous);
		vote.setAriclePlus(ariclePlus);
		vote.setDuplication(duplication);
		vote.setTitle(title);
		vote.setStudyNo(1);
		dao.insertVote(vote);
		int voteNum = vote.getNum();
		
		while(names.hasMoreElements()) {
			String param = names.nextElement();
			if(param.startsWith("aricle")) {
				VoteAricle va = new VoteAricle();
				va.setContent(req.getParameter(param));
				va.setNum(voteNum);
				dao.insertVoteAricle(va);
			}
		}
		resp.sendRedirect("votelist.do");
		
	}
	
}
