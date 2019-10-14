package kr.co.momstudy.boardfree.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;

@WebServlet("/boardfree/freedelete.do")
public class DeleteBoardFreeController extends HttpServlet {
	
	private BoardDAO dao;
	
	public DeleteBoardFreeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 데이터베이스 처리하기
		dao.deleteBoard(Integer.parseInt(req.getParameter("num"))); 
		res.sendRedirect("freelist.do");
	}
}











