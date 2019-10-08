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
		
		Score score = new Score();
		score.setEmail(req.getParameter("email"));
		score.setEmailRecom(user.getEmail());
		score.setNum(study.getNum());

		int result = dao.checkScore(score);
		PrintWriter out = resp.getWriter();
		
		if(result == 1) out.println("평가하셨습니다.");
		out.close();
	}

}
