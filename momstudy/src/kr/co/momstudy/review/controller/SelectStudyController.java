package kr.co.momstudy.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/review/selectStudy.do")
public class SelectStudyController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public SelectStudyController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		System.out.println("스터디 리스트 출력 폼으로 이동함");
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");

		// 현재 가입되어 있으면서 후기를 등록하지않은 모든 스터디 목록을 불러옴
		List<Study> slist = dao.selectStudy(user.getEmail());
		req.setAttribute("slist", slist);
		// 사용할 화면으로 이동하기
		req.getRequestDispatcher("/jsp/reviewBoard/choiceStudy.jsp").forward(req, res);
	}
}
