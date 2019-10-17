package kr.co.momstudy.boardfree.controller;

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

@WebServlet("/boardfree/freecommentlist.do")
public class CommentListFreeController extends HttpServlet {
	private BoardDAO dao;
	private CommentDAO dao1;
	
	public CommentListFreeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
		dao1 = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json; charset=utf-8");
		Board b = dao.selectOneBoard(Integer.parseInt(req.getParameter("num")));
		List<Comment> commentList = dao1.selectComment(b.getCommentGroupCode());

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		// 댓글 목록 ajax 처리
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
}
