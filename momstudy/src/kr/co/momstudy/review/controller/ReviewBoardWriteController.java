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
		
		System.out.println("글등록 화면으로 들어옴");
		
		FileUpload fu = new FileUpload(req, "reviewBoard");
		fu.upload();
		MultipartRequest request =  fu.getRequest();
		
		ReviewBoard rb = new ReviewBoard();
	
		rb.setTitle(request.getParameter("title"));
		rb.setContent(request.getParameter("content"));
		rb.setFileGroupCode(fu.getGroupCode());		
		rb.setScore(Integer.parseInt(request.getParameter("score")));
		// 스터디 번호 필요
//		rb.getStudyNum()
		HttpSession session = req.getSession();
		
		User user = (User)session.getAttribute("user");
		
		System.out.println("email : " + user.getEmail());
		System.out.println("score : " + Integer.parseInt(request.getParameter("score")));
		System.out.println("title : " + request.getParameter("title"));
		System.out.println("content : " + request.getParameter("content"));
		System.out.println("studyName : " + request.getParameter("studyName"));
		
		
//		dao.insertBoard(b);
//		
//		Enumeration<String> names = request.getFileNames();
//		while (names.hasMoreElements()) {
//			String name = names.nextElement();
//			FileUpload fu = new FileUpload();
//			fu.setNo(b.getNo());
//			fu.setSystemName(request.getFilesystemName(name));
//			fu.setOriginName(request.getOriginalFileName(name));
//			dao.insertFileUpload(fu);
//		}
		
	}
}
