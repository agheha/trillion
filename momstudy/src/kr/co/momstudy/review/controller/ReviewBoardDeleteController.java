package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;

@WebServlet("/review/delete.do")
public class ReviewBoardDeleteController extends HttpServlet {
	private ReviewBoardDAO dao;
	public ReviewBoardDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao.deleteReviewBoard(Integer.parseInt(req.getParameter("num")));
		res.sendRedirect("/momstudy/review/list.do");
	}
}