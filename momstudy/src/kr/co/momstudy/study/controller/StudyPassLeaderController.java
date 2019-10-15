package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.Study;

@WebServlet("/study/passstudyleader.do")
public class StudyPassLeaderController extends HttpServlet{
	StudyDAO dao;
	public StudyPassLeaderController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Enumeration<String> names = req.getParameterNames();
		Study study = (Study)req.getSession().getAttribute("study");
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			study.setEmail(req.getParameter(name));
			dao.updateStudyLeader(study);
		}
		resp.sendRedirect("member.do");
	}
}
