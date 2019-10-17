package kr.co.momstudy.review.controller;

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
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/review/commentList.do")
public class CommentListController extends HttpServlet {
	private ReviewBoardDAO dao;
	public CommentListController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json; charset=utf-8");
		
		ReviewBoard rb = dao.selectOneBoard(Integer.parseInt(req.getParameter("num")));
		List<Comment> commentList = dao.selectComment(rb.getCommentGroupCode());

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		// 댓글 목록 ajax 처리
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
}
