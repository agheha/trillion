package kr.co.momstudy.boardfree.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.CommentDAO;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.User;
@WebServlet("/boardfree/freecommentupdate.do")
public class CommentUpdateFreeController extends HttpServlet {
	private CommentDAO dao;
	
	public CommentUpdateFreeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
		
	}
	public void doPost(
			HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		User user = (User)req.getSession().getAttribute("user");
			
		Comment comment = new Comment();
		comment.setContent(req.getParameter("content"));
		comment.setNum(Integer.parseInt(req.getParameter("num")));
		comment.setEmail(user.getEmail());
		dao.updateComment(comment);
		
		res.sendRedirect("freedetail.do?no=" + Integer.parseInt(req.getParameter("commentGroupCode")));
		
		
	}
}
