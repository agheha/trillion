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

@WebServlet("/review/commentWrite.do")
public class CommentWriteController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public CommentWriteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		res.setContentType("application/json; charset=utf-8");
		// 넘어온 파라미터의 등록된 글번호를 받아옴
		int num = Integer.parseInt(req.getParameter("num"));
		if (num != 0) {
			req.setAttribute("num", num);
		}
		// 새로 등록될 객체를 생성
		Comment comment = new Comment();
		// 넘어온 파라미터의 현재 로그인 중인 유저의 이메일를 받아옴
		comment.setEmail(req.getParameter("email"));
		// 넘어온 파라미터의 content를 입력함
		comment.setContent(req.getParameter("content"));

		// 해당 글번호를 통해서 그룹코드 받아오는 쿼리 필요
		ReviewBoard rb = dao.selectOneBoard(num);
		int commentGroupCode = rb.getCommentGroupCode();
		comment.setCommentGroupCode(commentGroupCode);
		
		dao.insertComment(comment);
		
		
		// 댓글 목록 ajax 처리
		List<Comment> commentList = dao.selectComment(commentGroupCode);
		PrintWriter out = res.getWriter();
		out.println(new Gson().toJson(commentList));
		out.close();
	}
}
