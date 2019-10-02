package kr.co.momstudy.study.vote.controller;

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
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.Vote;

@WebServlet("/study/votelist.do")
public class VoteListController extends HttpServlet{
		VoteDAO dao;
		
		
	public VoteListController() {
			this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
		}


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Study study = (Study)req.getSession().getAttribute("study"); 
		int studyNum = study.getNum();
		
		String sPageNo = req.getParameter("PageNo");
		int pageNo = 1;
		if(sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		
		String filter = "regDate";
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Search search = new Search(pageNo);
		search.setStudyNum(studyNum);
		search.setFilter(filter);
		search.setKeyword(keyword);
		search.setType(type);
		
		List<Vote>	vlist = dao.selectVote(search);
		req.setAttribute("vlist", vlist);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/votelist.jsp");
		rd.forward(req, res);
	}
	
}
