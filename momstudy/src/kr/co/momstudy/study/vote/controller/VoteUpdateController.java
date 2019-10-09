package kr.co.momstudy.study.vote.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;

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

@WebServlet("/study/voteupdate.do")
public class VoteUpdateController extends HttpServlet{
	VoteDAO dao;
	public VoteUpdateController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		dao.deleteVote(num);
		
		User user = (User)req.getSession().getAttribute("user");
		Study study = (Study)req.getSession().getAttribute("study");
		
		Enumeration<String> names = req.getParameterNames();
		int duplication = 2;
		int anonumous= 2;
		int addaricle = 2;
		
		String title = req.getParameter("title");
		if(("on".equalsIgnoreCase(req.getParameter("duplication")))) duplication = 1;
		if("on".equalsIgnoreCase(req.getParameter("anonumous"))) anonumous = 1;
		if("on".equalsIgnoreCase(req.getParameter("addaricle"))) addaricle = 1;
		
		Vote vote = new Vote();
		vote.setEmail(user.getEmail());
		vote.setAnonumous(anonumous);
		vote.setAriclePlus(addaricle);
		vote.setDuplication(duplication);
		vote.setTitle(title);
		vote.setStudyNo(study.getNum());
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
		
		HashMap<String,Integer> nums = new HashMap();
		nums.put("newNum", num);
		nums.put("oldNum", voteNum);
		
		dao.updateVote(nums);
		
		resp.sendRedirect(req.getContextPath() + "/jsp/study/close.jsp");
		
		
	}
	
}
