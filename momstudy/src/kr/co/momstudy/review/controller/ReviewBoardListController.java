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
		
		System.out.println("후기게시판 리스트 출력화면");
		
		// 카테고리 리스트
		req.setAttribute("cList", dao.selectCategory());
		List clist = dao.selectCategory();
		for (int i = 0; i < clist.size(); i++) {
			System.out.println(clist);
		}
		
		// 전체 리스트 구해와서 파라미터로 공유
		req.setAttribute("list", dao.selectReviewBoard());
		
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/reviewBoard/reviewBoard.jsp").forward(req, res);
	}
}
