package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		// 등록된 글의 글 번호를 받아옴
		int num = Integer.parseInt(req.getParameter("num"));
		
		// 현재 로그인 중인 유저의 session을 받아옴
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		// 새로 등록될 객체를 생성
		Comment comment = new Comment();
		
		// 현재 로그인 중인 유저의 아이디를 받아옴
		comment.setEmail(user.getEmail());
		
		// 넘어온 파라미터의 content를 입력함
		comment.setContent(req.getParameter("content"));

		// 해당 글번호를 통해서 그룹코드 받아오는 쿼리 필요
		ReviewBoard rb = dao.selectOneBoard(num);
		comment.setCommentGroupCode(rb.getCommentGroupCode());
		
		dao.insertComment(comment);

		req.getRequestDispatcher("/review/detail.do?num=" + num).forward(req, res);
	}
}
