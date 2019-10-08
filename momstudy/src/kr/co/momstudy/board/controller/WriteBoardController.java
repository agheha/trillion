package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

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
 		dao.insertBoard(board);
		
		
		res.sendRedirect("list.do");
	}
}

