package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.FileVO;
import kr.co.momstudy.repository.vo.ReviewBoard;

@WebServlet("/review/detail.do")
public class ReviewBoardDetailController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public ReviewBoardDetailController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		ReviewBoard rb = dao.selectOneBoard(num);
		req.setAttribute("file", dao.selectFile(rb.getStudyNum()));
		req.setAttribute("rBoard", rb);
		req.setAttribute("study", dao.selectStudy2(rb.getStudyNum()));
		req.getRequestDispatcher("/jsp/reviewBoard/detailBoard.jsp").forward(req, res);
	}
}
