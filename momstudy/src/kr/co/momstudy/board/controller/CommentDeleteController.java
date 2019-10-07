package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.CommentDAO;

@WebServlet("/board/commentdelete.do")
public class CommentDeleteController extends HttpServlet {

	@Override
	public void doGet(
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CommentDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(CommentDAO.class);
		
		int no = Integer.parseInt(request.getParameter("num"));
		int commentNo = Integer.parseInt(request.getParameter("commentGroupCode"));
		
		dao.deleteComment(no);
		
		response.sendRedirect("detail.do?no=" + commentNo);
	}
}











