package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.StudyRecruitment;

@WebServlet("/study/studyrecruitmentupdateform.do")
public class StudyRecruitmentUpdateFormController extends HttpServlet {
private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentUpdateFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			int num = Integer.parseInt(req.getParameter("num"));
			
			StudyRecruitment str = dao.selectOneStudyRecruitment(num);

			req.setAttribute("str", str);
			
			RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/studyrecruitmentupdateform.jsp");
			rd.forward(req, res);
		
		}
}
