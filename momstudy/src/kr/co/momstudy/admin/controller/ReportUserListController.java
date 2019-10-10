package kr.co.momstudy.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;
import kr.co.momstudy.repository.vo.Report;
@WebServlet("/admin/reportuser.do")
public class ReportUserListController extends HttpServlet{
	AdminDAO dao;
	
	public ReportUserListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		List<Report> list = dao.selectUserReport();
		req.setAttribute("list", list);
		req.getRequestDispatcher("/jsp/admin/reportuser.jsp").forward(req, res);
	}
}
