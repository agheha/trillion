package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.StudyRecruitment;

@WebServlet("/study/studyrecruitmentlist.do")
public class StudyRecruitmentListController extends HttpServlet{
	private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String sPageNo = req.getParameter("PageNo");
		int pageNo = 1;
		if(sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		
		String filter = "regDate";
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
//		int categoryCode = Integer.parseInt(req.getParameter("categoryCode"));
		
		Search search = new Search(pageNo);
		
		search.setTypes("제목", "글쓴이", "내용");
		search.setFilters("일자", "조회수", "별점");
		search.setFilter(filter);
		search.setKeyword(keyword);
//		search.setCategoryCode(categoryCode);
		search.setType(type);

		List<StudyRecruitment> list = dao.selectStudyRecruitment(search);
		
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/studyrecruitmentlist.jsp");
		rd.forward(req, res);
	}
}
