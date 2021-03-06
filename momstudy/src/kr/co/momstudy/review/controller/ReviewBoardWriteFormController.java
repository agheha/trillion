package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;

@WebServlet("/review/writeForm.do")
public class ReviewBoardWriteFormController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public ReviewBoardWriteFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setAttribute("study", dao.selectStudy2(Integer.parseInt(req.getParameter("studyNum"))));
		req.getRequestDispatcher("/jsp/reviewBoard/writeForm.jsp").forward(req, res);
	}
}
