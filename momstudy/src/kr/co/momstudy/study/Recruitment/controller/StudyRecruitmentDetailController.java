package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.StudyRecruitment;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/studyrecruitmentdetail.do")
public class StudyRecruitmentDetailController extends HttpServlet{
private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentDetailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			int num = Integer.parseInt(req.getParameter("num"));
			
			// 글번호 넣어주면 조회수 증가
			dao.updateViewCnt(num);
			
			// 번호에 맞는 게시글 가져온다.
			StudyRecruitment str = dao.selectOneStudyRecruitment(num);
			req.setAttribute("str", str);
		
			req.getRequestDispatcher("/jsp/study/studyrecruitmentdetail.jsp").forward(req,res);
		}
	
}
