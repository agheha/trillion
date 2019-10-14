package kr.co.momstudy.boardfree.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.CommentDAO;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/boardfree/freecommentWrite.do")
public class CommentWriteFreeController extends HttpServlet {

	private CommentDAO dao;
	
	public CommentWriteFreeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
	}
	
	@Override
	public void doPost(
		HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		int no = Integer.parseInt(req.getParameter("num"));
		
		
		
		// 게시판과 파일 테이블에 저장할 글번호를 조회
		Comment comment = new Comment();
		comment.setCommentGroupCode(no);
		comment.setContent(req.getParameter("content"));
	//	comment.setCommentGroup(req.getParameter(""));
		comment.setEmail(user.getEmail());

		// 게시물 저장 처리 부탁..
		dao.insertComment(comment);
				
	
		//댓글 등록시 다시 상세정보창으로
		res.sendRedirect("freedetail.do?no=" + no);
	}
}











