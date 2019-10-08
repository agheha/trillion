package kr.co.momstudy.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.ReviewBoardDAO;
import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.util.FileUpload;

@WebServlet("/review/update.do")
public class ReviewBoardUpdateController extends HttpServlet {
	private ReviewBoardDAO dao;
	public ReviewBoardUpdateController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(ReviewBoardDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		FileUpload fu = new FileUpload(req, "reviewBoard");
		fu.upload();
		MultipartRequest request =  fu.getRequest();
		
		ReviewBoard rb = dao.selectOneBoard(Integer.parseInt(request.getParameter("num")));
		rb.setNum(rb.getNum());
		System.out.println(request.getParameter("title"));
		rb.setTitle(request.getParameter("title"));
		rb.setContent(request.getParameter("content"));
		rb.setScore(Integer.parseInt(request.getParameter("score")));
		rb.setFileGroupCode(fu.getGroupCode());
		
		dao.updateReviewBoard(rb);
		
		res.sendRedirect(req.getContextPath() + "/review/list.do");
	}
}
