package kr.co.momstudy.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.ReviewBoard;

@WebServlet("/review/list.do")
public class ReviewBoardListController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public ReviewBoardListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		// 전체 리스트 구해와서 파라미터로 공유
		req.setAttribute("list", dao.selectReviewBoard());
		
//		List<ReviewBoard> list = dao.selectReviewBoard();
//		System.out.println(list.size());
		
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/reviewBoard/reviewBoard.jsp").forward(req, res);
	}
}
