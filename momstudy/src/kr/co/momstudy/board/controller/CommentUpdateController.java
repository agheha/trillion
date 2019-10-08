package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.CommentDAO;
import kr.co.momstudy.repository.vo.Comment;
@WebServlet("/board/commentupdate.do")
public class CommentUpdateController extends HttpServlet {
	private CommentDAO dao;
	
	public CommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
		
	}
	public void doPost(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
			
		Comment comment = new Comment();
		comment.setContent(request.getParameter("content"));
		comment.setNum(Integer.parseInt(request.getParameter("num")));
		dao.updateComment(comment);
		
		response.sendRedirect("detail.do?no=" + Integer.parseInt(request.getParameter("commentGroupCode")));
		
		
	}
}
