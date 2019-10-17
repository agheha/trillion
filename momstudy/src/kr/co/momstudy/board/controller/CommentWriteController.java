package kr.co.momstudy.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.dao.CommentDAO;
import kr.co.momstudy.repository.vo.Board;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/commentWrite.do")
public class CommentWriteController extends HttpServlet {

	private CommentDAO dao;
	private BoardDAO dao1;
	
	public CommentWriteController() {
		dao1 = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
	}
	
	@Override
	public void doPost(
		HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json; charset=utf-8");
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		Comment comment = new Comment();
		comment.setEmail(user.getEmail());
		comment.setContent(req.getParameter("content"));

		int num = Integer.parseInt(req.getParameter("num"));
		// 게시물 저장 처리 부탁..
		
		Board b = dao1.selectOneBoard(num);
		int commentGroupCode = b.getCommentGroupCode();
		comment.setCommentGroupCode(commentGroupCode);
		dao.insertComment(comment);
				
		// 댓글 목록 ajax 처리
		List<Comment> commentList = dao.selectComment(commentGroupCode);
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
}











