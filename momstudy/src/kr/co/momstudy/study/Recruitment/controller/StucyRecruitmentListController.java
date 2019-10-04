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
import kr.co.momstudy.repository.vo.StudyRecruitment;

@WebServlet("/study/studyrecruitmentlist.do")
public class StucyRecruitmentListController extends HttpServlet{
	private StudyRecruitmentDAO strDao;
	
	public StucyRecruitmentListController() {
		this.strDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.getParameter("PageNo");
		
		List<StudyRecruitment> strList = strDao.selectStudyRecruitment();
		req.setAttribute("strList", strList);
		RequestDispatcher rd = req.getRequestDispatcher("");
		rd.forward(req, res);
	}
}
