package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.PageResult;

@WebServlet("/study/adminmember.do")
public class StudyAdminMemberController extends HttpServlet{
	UserDAO dao;
	
	public StudyAdminMemberController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Study study = (Study)req.getSession().getAttribute("study"); 
		int studyNum = study.getNum();
		
		
		String sPageNo = req.getParameter("pageNo");
		int pageNo = 1;
		int count = 0;
		if(sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		
		String filter = "partDate";
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Search search = new Search(pageNo);
		
		search.setTypes("이메일");
		search.setFilters("신청일");
		search.setStudyNum(studyNum);
		search.setFilter(filter);
		search.setKeyword(keyword);
		search.setType(type);
		
		
		int year = Calendar.getInstance().get(Calendar.YEAR);
		
		List<User> ulist = dao.selectUserByStudyNum(search);
		
		if(ulist.size() != 0) {
			count = ulist.get(0).getCnt();
		}
		
		PageResult pr = new PageResult(pageNo,count);
		
		req.setAttribute("year", year);
		req.setAttribute("ulist", ulist);
		req.setAttribute("pr", pr);
		req.setAttribute("search", search);
		
		req.getRequestDispatcher("/jsp/study/adminstudymembers.jsp").forward(req, resp);
		
		
		
	}
	
}
