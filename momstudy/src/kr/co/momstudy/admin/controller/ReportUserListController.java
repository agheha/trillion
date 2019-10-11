package kr.co.momstudy.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

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

		String no = req.getParameter("no");
		
		if (no == null) {
			List<Report> list = dao.selectUserReport();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/jsp/admin/reportuser.jsp").forward(req, res);
			
		} else {
			int num = Integer.parseInt(no);
			Report report = dao.selectOneUserReport(num);

			PrintWriter out = res.getWriter();
			out.println(new Gson().toJson(report));
			out.close();
		}
		
	}
}
