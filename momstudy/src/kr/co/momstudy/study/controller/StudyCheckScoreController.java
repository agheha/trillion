package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Score;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/checkscore.do")
public class StudyCheckScoreController  extends HttpServlet{
	StudyDAO dao;
	
	public StudyCheckScoreController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setCharacterEncoding("utf-8");
		User user = (User)req.getSession().getAttribute("user");
		Study study = (Study)req.getSession().getAttribute("study");
		String Recomemail = user.getEmail(); 
		
		Score score = new Score();
		String email = req.getParameter("email");
		score.setEmail(email);
		score.setEmailRecom(Recomemail);
		score.setNum(study.getNum());


		int result = dao.checkScore(score);
		PrintWriter out = resp.getWriter();
		
		if(email.equals(Recomemail)) {
			out.println("다른 스터디원에게 별점을 주세요.");
			return;
		}
		
		if(result == 1) out.println("평가하셨습니다.");
		out.close();
	}

}
