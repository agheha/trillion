package kr.co.momstudy.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;
@WebServlet("/admin/reportstudy.do")
public class ReportStudyListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminDAO dao =MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
		
		res.setContentType("text/html;charset=UTF-8");
		
		 req.setAttribute("list",  dao.selectStudyReport());
		 req.getRequestDispatcher("/jsp/admin/reportstudy.jsp").forward(req, res);
	}
}
