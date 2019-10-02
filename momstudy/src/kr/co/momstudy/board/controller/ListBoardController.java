package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
@WebServlet("/board/list.do")
public class ListBoardController extends HttpServlet {
	
	private BoardDAO dao;
	
	public ListBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	// 데이터를 구하고 공유 영역에 올림
      req.setAttribute("list", dao.selectBoard());
      req.getRequestDispatcher("/jsp/board/list.jsp").forward(req, res);
    }	

}
