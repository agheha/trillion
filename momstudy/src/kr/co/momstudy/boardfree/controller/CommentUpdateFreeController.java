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
	public void service(
			HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(req.getParameter("commentNum"));
		int commentGroupCode = Integer.parseInt(req.getParameter("commentGroupCode"));
		String content = req.getParameter("content");
		User user = (User)req.getSession().getAttribute("user");
		
		System.out.println("num = " + num);
		System.out.println("content = " + content);
		System.out.println("groupCode = " + commentGroupCode);
			
        Comment comment = new Comment();
		comment.setContent(req.getParameter("content"));
		
		//comment.setEmail(user.getEmail());
		dao.updateComment(comment);
			
		List<Comment> commentList = dao.selectComment(Integer.parseInt(req.getParameter("commentGroupCode")));
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();	
		
	}
}
