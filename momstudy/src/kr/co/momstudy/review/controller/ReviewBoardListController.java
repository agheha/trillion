package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.util.PageResult;

@WebServlet("/review/list.do")
public class ReviewBoardListController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public ReviewBoardListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		String sPageNo = req.getParameter("pageNo");
		int pageNo = 1;
		if(sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		
		String filter = "regDate";
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Search search = new Search(pageNo);
		search.setTypes("제목","글쓴이","내용","스터디명");
		search.setFilters("일자","별점","조회수");
		search.setFilter(filter);
		search.setKeyword(keyword);
		search.setType(type);
		
		req.setAttribute("search", search);
		req.setAttribute("list", dao.selectReviewBoard(search));
		req.getRequestDispatcher("/jsp/reviewBoard/reviewBoard.jsp").forward(req, res);
	}
}
