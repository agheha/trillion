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

@WebServlet("/study/studydeletemember.do")
public class StudyDeleteMemberController extends HttpServlet{
	StudyDAO dao;
	public StudyDeleteMemberController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Enumeration<String> names = req.getParameterNames();
		Study study = (Study)req.getSession().getAttribute("study");
		int studyNum = study.getNum();
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			Participant pt = new Participant();
			pt.setEmail(req.getParameter(name));
			System.out.println(req.getParameter(name));
			System.out.println(studyNum);
			pt.setStudyNum(studyNum);
			dao.deleteParticipant(pt);
		}
		
		resp.sendRedirect("adminmember.do");
	
	}
	
}
