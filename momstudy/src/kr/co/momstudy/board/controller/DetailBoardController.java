package kr.co.momstudy.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.CommentDAO;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.vo.Comment;

@WebServlet("/board/detail.do")
public class DetailBoardController extends HttpServlet {
    private BoardDAO dao;
	private CommentDAO dao1;
	
	public DetailBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
		dao1 = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		int num = Integer.parseInt(req.getParameter("no"));
		String type = (req.getParameter("type") != null ? req.getParameter("type") : "");
		
		//dao.updateViewCnt(no);
		
		req.setAttribute("board", dao.selectOneBoard(num));
		// req.setAttribute("commentGroupCode", commentGroupCode);
		req.setAttribute("type", type);
		
		if(type.equals("modify")) {
			int commentGroupCode = Integer.parseInt(req.getParameter("commentGroupCode"));
			int commentNo = Integer.parseInt(req.getParameter("commentNo"));
			
			req.setAttribute("commentGroupCode", commentGroupCode);
			req.setAttribute("commentNo", commentNo);
		} else if (type.equals("reply")) {
			
			int parentNo = Integer.parseInt(req.getParameter("parentNo"));
			
			req.setAttribute("parentNo", parentNo);
		}
		
		// 댓글 목록 공유
		List<Comment> commentList = dao1.selectComment(num);
		System.out.println("commentList = " + commentList);
		req.setAttribute("commentList", commentList);
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/board/detail.jsp");
		rd.forward(req, res);
	}
}











