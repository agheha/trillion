package kr.co.momstudy.boardfree.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/boardfree/freeupdateform.do")
public class UpdateFormBoardFreeController extends HttpServlet {

	private BoardDAO dao;
	
	public UpdateFormBoardFreeController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 게시물 상세 정보 조회하기
		
		req.setAttribute("board", dao.selectOneBoard(Integer.parseInt(req.getParameter("num"))));
		User user = (User)req.getSession().getAttribute("user");
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/board/updateformfree.jsp");
		rd.forward(req, res);
	}
}










