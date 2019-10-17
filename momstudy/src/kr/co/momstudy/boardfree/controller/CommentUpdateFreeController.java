package kr.co.momstudy.boardfree.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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
		res.setContentType("application/json; charset=utf-8");
        Comment comment = new Comment();
		comment.setContent(req.getParameter("content"));
		comment.setNum(Integer.parseInt(req.getParameter("commentNum")));
		comment.setCommentGroupCode(Integer.parseInt(req.getParameter("commentGroupCode")));
		
		dao.updateComment(comment);
			
		List<Comment> commentList = dao.selectComment(Integer.parseInt(req.getParameter("commentGroupCode")));
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();	
		
	}
}
