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

@WebServlet("/study/studywrite.do")
public class StudyWriteController extends HttpServlet{
	StudyDAO dao;

	public StudyWriteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		User user =  (User)req.getSession().getAttribute("user");
		String email = user.getEmail();
		
		Study study = new Study();
		
		study.setEmail(email);
		study.setName(name);
		study.setCategoryCode(Integer.parseInt(req.getParameter("category")));
		study.setAddressCode(1);
		
		dao.insertStudy(study);
		
		Participant pt = new Participant();
		pt.setEmail(email);
		pt.setCondition(2);
		pt.setStudyNum(study.getNum());
		
		dao.insertParticipant(pt);
		
		resp.sendRedirect(req.getContextPath() +"/user/mypage.do");
		
	}
	
	
}
