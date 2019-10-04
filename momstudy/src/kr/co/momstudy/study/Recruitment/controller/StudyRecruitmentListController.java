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

@WebServlet("/study/recruitmentlist.do")
public class StudyRecruitmentListController extends HttpServlet{
	private StudyRecruitmentDAO strDao;
	
	public StudyRecruitmentListController() {
		this.strDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String sPageNo = req.getParameter("PageNo");
		int pageNo = 1;
		if(sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		
		Search search = new Search(pageNo);
		search.setFilter("regDate");
		search.setType("title");
		search.setKeyword("");
		
		List<StudyRecruitment> strList = strDao.selectStudyRecruitment();
		req.setAttribute("strList", strList);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/studyrecruitmentlist.jsp");
		rd.forward(req, res);
	}
}
