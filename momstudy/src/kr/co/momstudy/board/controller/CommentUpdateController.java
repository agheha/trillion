package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.dao.CommentDAO;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;
@WebServlet("/board/commentupdate.do")
public class CommentUpdateController extends HttpServlet {
	private CommentDAO dao;
	
	public CommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
		
	}
	public void doPost(
			HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 req.setCharacterEncoding("utf-8");
		 HttpSession session = req.getSession();
	     Study study = (Study)session.getAttribute("study");
	     User user = (User)req.getSession().getAttribute("user");
	     int studyNum = study.getNum();
			
		Comment comment = new Comment();
		comment.setContent(req.getParameter("content"));
		comment.setNum(Integer.parseInt(req.getParameter("num")));
		comment.setEmail(user.getEmail());
		
		dao.updateComment(comment);
		
		res.sendRedirect("detail.do?no=" + Integer.parseInt(req.getParameter("commentGroupCode")));
	}
}
