package kr.co.momstudy.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/studyinfo.do")
public class StudyInfoController extends HttpServlet{
	StudyDAO dao;

	public StudyInfoController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Study study = (Study)req.getSession().getAttribute("study");
		
		Study studyinfo = dao.selectStudyInfo(study.getNum());
		req.setAttribute("studyinfo", studyinfo);
		req.getRequestDispatcher("/jsp/study/studyinfo.jsp").forward(req, resp);
		
	}
	
	
}
