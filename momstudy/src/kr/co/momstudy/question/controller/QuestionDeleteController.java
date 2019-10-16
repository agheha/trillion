package kr.co.momstudy.question.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.QuestionDAO;

@WebServlet("/question/questiondelete.do")
public class QuestionDeleteController extends HttpServlet {	
	private QuestionDAO dao;
	
	public QuestionDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QuestionDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao.deleteQuestion(Integer.parseInt(req.getParameter("num")));
		res.sendRedirect(req.getContextPath() + "/question/questionform.do");
	}
}