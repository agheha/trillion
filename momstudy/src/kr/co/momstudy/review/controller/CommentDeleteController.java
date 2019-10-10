package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;

@WebServlet("/review/commentDelete.do")
public class CommentDeleteController extends HttpServlet {
	private ReviewBoardDAO dao;
	public CommentDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		int commentGroupCode = Integer.parseInt(req.getParameter("commentGroupCode"));
		dao.deleteComment(num, commentGroupCode);
		int num2 = dao.selectOneBoard3(commentGroupCode);
		res.sendRedirect("/momstudy/review/detail.do?num="+num2);
	}
}
