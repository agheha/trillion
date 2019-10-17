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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.vo.Board;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.MomstudyFileRenamePolicy;

@WebServlet("/study/update.do")
public class UpdateBoardController extends HttpServlet {
	
	private BoardDAO dao;
	
	public UpdateBoardController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		HttpSession session = req.getSession();
		Study study = (Study)session.getAttribute("study");
		User user = (User)req.getSession().getAttribute("user");
		int studyNum = study.getNum();
		int boardNum = Integer.parseInt(req.getParameter("num"));

		// 파라미터 정보를 읽어 데이터베이스에 저장하기
		Board board = dao.selectOneBoard(boardNum);
		board.setTitle(req.getParameter("title"));
		board.setContent(req.getParameter("content"));
		board.setEmail(user.getEmail());
		board.setStudyNo(studyNum);
		
		String type = req.getParameter("type");
		String notice = req.getParameter("notice");
	   
		
		if (notice == null) {
			board.setNotice(1);
		} else {
			board.setNotice(0);	
		}
		
		if (type == null) {
			board.setType(1);
			dao.updateBoard(board);
		} else {
			board.setType(0);
			dao.updateBoard2(board);
		}
		
		if (type != null) {
			board.setType(0);
			dao.updateBoard(board);
		} else {
			board.setType(1);
			dao.updateBoard2(board);
		}
		
		dao.updateBoard(board);
        
		res.sendRedirect("list.do");
	}
}










