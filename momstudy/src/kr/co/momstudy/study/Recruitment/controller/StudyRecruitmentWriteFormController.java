package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.Address;
import kr.co.momstudy.repository.vo.StudyRecruitment;

@WebServlet("/study/studyrecruitmentwriteform.do")
public class StudyRecruitmentWriteFormController extends HttpServlet{
	
	private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentWriteFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.getRequestDispatcher("/jsp/study/studyrecruitmentwriteform.jsp").forward(req, res);
	}
}
