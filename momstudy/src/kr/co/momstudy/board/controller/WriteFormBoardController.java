package kr.co.momstudy.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/board/writeform.do")
public class WriteFormBoardController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.getRequestDispatcher("writeform.jsp").forward(req, res);
		
		RequestDispatcher rd = req.getRequestDispatcher("writeform.jsp");
		rd.forward(req, res);
	}
}









