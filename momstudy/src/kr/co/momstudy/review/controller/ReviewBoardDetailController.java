package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/review/detailBoard.do")
public class ReviewBoardDetailController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public ReviewBoardDetailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ReviewBoard rb = dao.selectOneReviewBoard(Integer.parseInt(req.getParameter("num")));
		
		System.out.println(rb.getTitle());
		System.out.println(rb.getContent());
		System.out.println(rb.getEmail());
		System.out.println(rb.getNum());
		
		req.setAttribute("rBoard", rb);
		req.setAttribute("name", dao.selectName(rb.getEmail()));

		req.getRequestDispatcher("/jsp/reviewBoard/detailBoard.jsp").forward(req, res);
	}
}
