package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.vo.Board;

@WebServlet("/board/write.do")
public class WriteBoardController extends HttpServlet {
	private BoardDAO dao;
	
	public WriteBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) 
	                      throws ServletException, IOException {
		
		Board board = new Board(); 
		
		board.setTitle(req.getParameter("title"));
		board.setContent(req.getParameter("content"));
		board.setEmail("k@k.k");

		String type = req.getParameter("type");
		String notice = req.getParameter("notice");
	   
		
		if (notice == null) {
			board.setNotice(1);
		} else {
			board.setNotice(0);	
		}
		
		if (type == null) {
			board.setType(1);
			dao.insertBoard(board);
		} else {
			board.setType(0);
			dao.insertBoard2(board);
		}
		
		
		res.sendRedirect("list.do");
   }
}

