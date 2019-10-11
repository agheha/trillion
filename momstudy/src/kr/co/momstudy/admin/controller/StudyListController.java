package kr.co.momstudy.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;
@WebServlet("/admin/study.do")
public class StudyListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminDAO dao =MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
		
		 req.setAttribute("list",  dao.selectStudy());
		 req.getRequestDispatcher("/jsp/admin/study.jsp").forward(req, res);
	}
}
