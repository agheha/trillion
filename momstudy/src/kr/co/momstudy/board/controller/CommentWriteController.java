package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.vo.Comment;

@WebServlet("/board/comment_regist.do")
public class CommentWriteController extends HttpServlet {

	private BoardDAO dao;
	
	public CommentWriteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	@Override
	public void doPost(
			HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(req.getParameter("num"));
		
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		Comment comment = new Comment();
		comment.setNum(no);
		comment.setContent(req.getParameter("content"));
		comment.setEmail(req.getParameter("email"));
		
		// 게시물 저장 처리 부탁..
		dao.insertComment(comment);
		
		res.sendRedirect("detail.do?no=" + no);
	}
}











