package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;

@WebServlet("/board/updateform.do")
public class UpdateFormBoardController extends HttpServlet {

	private BoardDAO dao;
	
	public UpdateFormBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		
		req.setAttribute("board", dao.selectOneBoard(Integer.parseInt(req.getParameter("num"))));
		
		System.out.println(Integer.parseInt(req.getParameter("num")));
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/board/updateform.jsp");
		rd.forward(req, res);
	}
}










