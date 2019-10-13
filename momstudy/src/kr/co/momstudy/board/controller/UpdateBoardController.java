package kr.co.momstudy.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.vo.Board;
import kr.co.momstudy.util.MomstudyFileRenamePolicy;

@WebServlet("/board/update.do")
public class UpdateBoardController extends HttpServlet {
	
	private BoardDAO dao;
	
	public UpdateBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		// 파라미터 정보를 읽어 데이터베이스에 저장하기
		Board b = dao.selectOneBoard(Integer.parseInt(req.getParameter("no")));
		b.setTitle(req.getParameter("title"));
		b.setContent(req.getParameter("content"));
		dao.updateBoard(b);
        
		res.sendRedirect("list.do");
	}
}










