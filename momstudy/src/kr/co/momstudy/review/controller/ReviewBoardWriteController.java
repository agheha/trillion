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
		
		// 글등록에서는 카운트 올릴 필요 x
//		dao.updateViewCnt(studyNum);
		
		// 글등록이 완료 되면 글등록가능한
		// 해당하는  tb_participant 에서 테이블 condition을 1로
		
		res.sendRedirect(req.getContextPath() + "/review/list.do");
		
//		System.out.println("num : sequence.nextVal");
//		System.out.println("title : " + request.getParameter("title"));
//		System.out.println("content : " + request.getParameter("content"));
//		System.out.println("regDate : sysdate");
//		System.out.println("studyNum : " + Integer.parseInt(request.getParameter("studyNum")));
//		System.out.println("see_cnt : cnt++");
//		System.out.println("score : " + Integer.parseInt(request.getParameter("score")));
//		System.out.println("email : " + user.getEmail());
//		System.out.println("file_group_code : later");
//		System.out.println("comment_group_code : later");
		
		
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
