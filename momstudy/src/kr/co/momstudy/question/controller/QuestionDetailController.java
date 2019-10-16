package kr.co.momstudy.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.QuestionDAO;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.Question;

@WebServlet("/question/questiondetail.do")
public class QuestionDetailController extends HttpServlet {
	private QuestionDAO dao;
	
	public QuestionDetailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QuestionDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Question question = dao.selectOneQuestion(Integer.parseInt(req.getParameter("num")));
		
		List<Comment> comment = dao.selectAdminQuestioncomment(question.getNum());
		
		req.setAttribute("question", question);
		req.setAttribute("comment", comment);
		req.getRequestDispatcher("/jsp/question/questiondetail.jsp").forward(req, res);
	}
}
