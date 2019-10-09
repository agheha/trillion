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
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.StudyRecruitment;

@WebServlet("/study/studymain.do")
public class StudyMainController extends HttpServlet{
	StudyDAO dao;
	StudyRecruitmentDAO strDao;
	
	
	public StudyMainController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
		this.strDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int studyNum = Integer.parseInt(req.getParameter("num"));
		Study study = dao.selectOneStudy(studyNum);
		
		// 스터디 모집글 유무
		StudyRecruitment str = strDao.whetherStudyRecruitment(studyNum);
		if (str != null) {
			req.setAttribute("str", str);
		}
		
		req.getSession().setAttribute("study", study);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/studymain.jsp");
		rd.forward(req, resp);
	}

	
}
