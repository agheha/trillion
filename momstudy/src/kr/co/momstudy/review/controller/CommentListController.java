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
		ReviewBoard rb = dao.selectOneBoard(Integer.parseInt(req.getParameter("num")));
		List<Comment> commentList = dao.selectComment(rb.getCommentGroupCode());

		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		/*
		 * System.out.println("0번째 이메일 주소(댓글작성자) : " + commentList.get(0).getEmail());
		 * System.out.println("현재 로그인중인 유저" + user.getEmail());
		 */
		
		for (int i = 0; i < commentList.size(); i++) {
			if (user.getEmail().equals(commentList.get(i).getEmail())) {
				// 댓글작성자가 현재로그인한 사람일 경우 1을 넣고
				commentList.get(i).setCommentGroup(1);
				/* System.out.println("넘어온 후 : " + commentList.get(i).getEmail()); */
				continue;
			}
			// 댓글작성자가 현재로그인한 사람과 다를 경우 0을 넣음
			commentList.get(i).setCommentGroup(0);
		}
		
		
		// 댓글 목록 ajax 처리
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
}
