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
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.dao.CommentDAO;
import kr.co.momstudy.repository.vo.Comment;

@WebServlet("/boardfree/freecommentdelete.do")
public class CommentDeleteFreeController extends HttpServlet {
     private BoardDAO dao;
     private CommentDAO dao1;
     
     public CommentDeleteFreeController() {
    	 this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
    	 this.dao1 = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
     }
	@Override
	public void service(
		HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json; charset=utf-8");
	     
		int num = Integer.parseInt(req.getParameter("num"));
		dao1.deleteComment(num);
		 
		List<Comment> commentList = dao1.selectComment(Integer.parseInt(req.getParameter("commentGroupCode")));
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
}











