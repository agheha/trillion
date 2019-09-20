package kr.co.momstudy.test.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.FileDAO;
import kr.co.momstudy.util.FileUpload;

@WebServlet("/test/fileupload.do")
public class FileUploadController extends HttpServlet{
	FileDAO dao;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(FileDAO.class);
		FileUpload fu = new FileUpload(req, "/test");
		fu.upload();
		System.out.println(fu.getGroupCode());
	}
	
}
