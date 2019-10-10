package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.Study;

@WebServlet("/review/updateForm.do")
public class ReviewBoardUpdateFormController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public ReviewBoardUpdateFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ReviewBoard rb = dao.selectOneBoard(Integer.parseInt(req.getParameter("num")));
		req.setAttribute("rBoard", rb);
		req.setAttribute("study", dao.selectStudy2(rb.getStudyNum()));
		req.getRequestDispatcher("/jsp/reviewBoard/updateForm.jsp").forward(req, res);
	}
}
