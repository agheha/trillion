package kr.co.momstudy.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/applyforparticipation.do")
public class StudyApplyParticipationController extends HttpServlet{
	
	private StudyDAO dao;
	
	public StudyApplyParticipationController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("user");
			
			Participant part = new Participant();
			part.setEmail(user.getEmail());
			part.setStudyNum(Integer.parseInt(req.getParameter("studynum")));
			
			part.setCondition(1);
			
			// 참여자로 넣어 준다.
			dao.insertParticipant(part);
		
		res.sendRedirect(req.getContextPath() + "/study/studyrecruitmentlist.do");
	}
	
}
