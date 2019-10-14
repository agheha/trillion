package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.StudyRecruitment;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/studyrecruitmentdetail.do")
public class StudyRecruitmentDetailController extends HttpServlet{
private StudyRecruitmentDAO dao;
private StudyDAO sDao;
	
	public StudyRecruitmentDetailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
		this.sDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	
	@Override
		protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			int num = Integer.parseInt(req.getParameter("num"));
			
			// 글번호 넣어주면 조회수 증가
			dao.updateViewCnt(num);
			
			// 번호에 맞는 게시글 가져온다.
			StudyRecruitment str = dao.selectOneStudyRecruitment(num);
			req.setAttribute("str", str);
			
			// 파일 꺼내서 공유영역에 올려놓는다.
			req.setAttribute("file", dao.selectFile(str.getStudyNum()));
			
			// 로그인 되어있는 유저의 스터디 참여 가능여부 확인
			HttpSession session = req.getSession();
			User user = (User)session.getAttribute("user");
			Participant part = new Participant();
			part.setEmail(user.getEmail());
			
			part.setStudyNum(str.getStudyNum());
			
			// 0이면 신청한 적이 없는 유저다.
			int no = sDao.CheckParticipation(part);
			
			req.setAttribute("p_flag", no == 0 ? true : false);
		
			req.getRequestDispatcher("/jsp/study/studyrecruitmentdetail.jsp").forward(req,res);
		}
	
}
