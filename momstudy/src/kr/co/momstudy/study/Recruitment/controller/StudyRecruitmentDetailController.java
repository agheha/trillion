package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.StudyRecruitment;

@WebServlet("/study/studyrecruitmentdetail.do")
public class StudyRecruitmentDetailController extends HttpServlet{
private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentDetailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			
			int num = Integer.parseInt(req.getParameter("num"));
			StudyRecruitment str = dao.selectOneStudyRecruitment(num);
			req.setAttribute("studyRecruitment", str);
		
			req.getRequestDispatcher("studyrecruitmentdetail.jsp").forward(req,res);
		}
	
}
