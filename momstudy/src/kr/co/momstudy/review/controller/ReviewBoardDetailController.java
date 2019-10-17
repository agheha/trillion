package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		// parameter 받아오기 (해당 글 번호)
		int num = Integer.parseInt(req.getParameter("num"));
		
		// 조회수 올리기
		dao.updateViewCnt(num);
		
		// 해당 글번호의 vo를 db에서 찾아오기
		ReviewBoard rb = dao.selectOneBoard(num);
		
		// 해당 글번호의 스터디 번호를 통해 이미지 vo를 jsp로 공유
		req.setAttribute("file", dao.selectFile(rb.getNum()));
		// 해당 글번호의 스터디 번호를 통해 해당 스터디 vo를 jsp로 공유
		req.setAttribute("study", dao.selectStudy2(rb.getStudyNum()));
		// 해당 vo를 jsp로 공유
		req.setAttribute("rBoard", rb);
		
		// 해당 글의 comment 리스트를 불러와서 voList를 jsp로 공유
		req.setAttribute("comment", dao.selectComment(rb.getCommentGroupCode()));
		
		// jsp로 이동
		req.getRequestDispatcher("/jsp/reviewBoard/detailBoard.jsp").forward(req, res);
	}
}
