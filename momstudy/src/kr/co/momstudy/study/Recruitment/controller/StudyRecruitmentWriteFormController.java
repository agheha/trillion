package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;

@WebServlet("/study/studyrecruitmentwriteform.do")
public class StudyRecruitmentWriteFormController extends HttpServlet{
	
	private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentWriteFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
	}
}
