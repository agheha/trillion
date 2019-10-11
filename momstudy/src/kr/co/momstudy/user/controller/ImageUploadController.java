package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
<<<<<<< HEAD
import kr.co.momstudy.util.FileUpload;
=======
import kr.co.momstudy.repository.vo.FileVO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/imgupload.do")
public class ImageUploadController extends HttpServlet {
	private UserDAO dao;
	public ImageUploadController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		res.setContentType("image/pjpeg");
		PrintWriter out = res.getWriter();
		User user = (User)req.getSession().getAttribute("user");
		// 세션 정보를 주고 내 이미지 파일경로와 파일명을 받아옴
		FileVO f = dao.myimgGroupCode(user);
		out.println(new Gson().toJson(f));
		out.close();
	}
}
