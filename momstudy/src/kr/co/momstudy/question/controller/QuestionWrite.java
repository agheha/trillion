package kr.co.momstudy.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.QuestionDAO;
import kr.co.momstudy.repository.vo.Question;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/question/questionwrite.do")
public class QuestionWrite extends HttpServlet{	
	private QuestionDAO dao;
	
	public QuestionWrite() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QuestionDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		Question question = new Question();
		question.setEmail(user.getEmail());
		question.setTitle(req.getParameter("title"));
		question.setContent(req.getParameter("content"));
		dao.questionWrite(question);
	}
}
