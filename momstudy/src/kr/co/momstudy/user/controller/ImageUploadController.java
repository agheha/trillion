package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.FileDAO;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.util.FileUpload;
import sun.security.mscapi.KeyStore.MY;

@WebServlet("/user/myimg.do")
public class ImageUploadController extends HttpServlet{
	FileDAO dao;
	private UserDAO userDao;
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(FileDAO.class);
		userDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
		FileUpload fu = new FileUpload(req, req.getParameter("path"));
		fu.upload();
		
		req.getRequestDispatcher("/user/userinfo.do").forward(req, res);
	}
	
}
