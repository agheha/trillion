package kr.co.momstudy.study.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Study;

@WebServlet("/study/studymain.do")
public class StudyMainController extends HttpServlet{
	StudyDAO dao;
	
	public StudyMainController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int studyNum = Integer.parseInt(req.getParameter("num"));
		Study study = dao.selectOneStudy(studyNum);
		req.getSession().setAttribute("study", study);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/studymain.jsp");
		rd.forward(req, resp);
	}

	
}
