package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.FileUpload;

@WebServlet("/review/write.do")
public class ReviewBoardWriteController extends HttpServlet {
	
	private ReviewBoardDAO dao;
	public ReviewBoardWriteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		FileUpload fu = new FileUpload(req, "reviewBoard");
		fu.upload();
		MultipartRequest request =  fu.getRequest();
		
		ReviewBoard rb = new ReviewBoard();
	
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		rb.setTitle(request.getParameter("title"));
		rb.setContent(request.getParameter("content"));
		int studyNum = Integer.parseInt(request.getParameter("studyNum"));
		rb.setStudyNum(studyNum);
		rb.setScore(Integer.parseInt(request.getParameter("score")));
		rb.setFileGroupCode(fu.getGroupCode());
		rb.setEmail(user.getEmail());
		
		dao.insertReviewBoard(rb);
		
		res.sendRedirect(req.getContextPath() + "/review/list.do");
	}
}
