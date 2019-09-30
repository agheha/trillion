package kr.co.momstudy.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

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

@WebServlet("/board/write.do")
public class WriteBoardController extends HttpServlet {
	private BoardDAO dao;
	
	public WriteBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
	
	public void service(HttpServletRequest req, HttpServletResponse res) 
	                      throws ServletException, IOException {
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String filePath = "/board" + sdf.format(new Date());
		File file = new File("c:/java/boardman" + filePath);
		if(file.exists() == false) file.mkdirs();

		MultipartRequest request = new MultipartRequest(
				req,
				file.getPath(),
				1024 * 1024 * 100,
				"utf-8",
				new MomstudyFileRenamePolicy()
		);
		req.setCharacterEncoding("utf-8");
		Board board = new Board();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setEmail("naver@n.n");
 		dao.insertBoard(board);
		
		Enumeration<String> names = request.getFileNames();
		while (names.hasMoreElements()) {
			String fName = names.nextElement();
			File f = request.getFile(fName);
			
			if (f != null) {
				System.out.println("파일의 크기 : " + f.length());
				String orgName = request.getOriginalFileName(fName);
				System.out.println("원본 파일명 : " + orgName);
				String sysName = request.getFilesystemName(fName);
				System.out.println("시스템 저장 파일명 : " + sysName);
				
				//file f1 = new file();
				
				//dao.insertFile(f1);
		   }
		}
		res.sendRedirect("list.do");
		System.out.println("파일 업로드 성공");
	}
}

