package kr.co.momstudy.review.controller;

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
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.Comment;

@WebServlet("/review/commentUpdate.do")
public class CommentUpdateController extends HttpServlet {
	private ReviewBoardDAO dao;
	public CommentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int num = Integer.parseInt(req.getParameter("commentNum"));
		int commentGroupCode = Integer.parseInt(req.getParameter("commentGroupCode"));
		String content = req.getParameter("content");

		System.out.println("num = " + num);
		System.out.println("content = " + content);
		System.out.println("groupCode = " + commentGroupCode);
		
		Comment comment = dao.selectOneComment(num);
		comment.setContent(content);
		
		dao.updateComment(comment);
		
		List<Comment> commentList = dao.selectComment(Integer.parseInt(req.getParameter("commentGroupCode")));
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
}
