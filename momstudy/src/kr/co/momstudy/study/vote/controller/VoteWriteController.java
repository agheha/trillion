package kr.co.momstudy.study.vote.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;
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
		User user = (User)req.getSession().getAttribute("user");
		Study study = (Study)req.getSession().getAttribute("study"); 
		
		int studyNum = study.getNum();
		Enumeration<String> names = req.getParameterNames();
		int duplication = 2;
		int anonumous= 2;
		int addaricle = 2;
		
		String title = req.getParameter("title");
		if(("on".equalsIgnoreCase(req.getParameter("duplication")))) duplication = 1;
		if("on".equalsIgnoreCase(req.getParameter("anonumous"))) anonumous = 1;
		if("on".equalsIgnoreCase(req.getParameter("addaricle"))) addaricle = 1;
		String limitDate = req.getParameter("limitDate");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Vote vote = new Vote();
		vote.setAnonumous(anonumous);
		vote.setAriclePlus(addaricle);
		vote.setDuplication(duplication);
		vote.setTitle(title);
		vote.setStudyNo(studyNum);
		vote.setEmail(user.getEmail());
		
		try {
			vote.setLimitDate(sdf.parse(limitDate));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
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
		resp.sendRedirect(req.getContextPath() + "/jsp/study/close.jsp");
		
	}
	
}
