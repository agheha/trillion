package kr.co.momstudy.question.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.QuestionDAO;
import kr.co.momstudy.repository.vo.Question;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/question/questionupdate.do")
public class QuestionUpdateController extends HttpServlet {	
	private QuestionDAO dao;
	
	public QuestionUpdateController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QuestionDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		Question question = new Question();
		question.setEmail(user.getEmail());
		question.setNum(Integer.parseInt(req.getParameter("num")));
		question.setContent(req.getParameter("content"));
		dao.updateQuestion(question);
		
	}
}