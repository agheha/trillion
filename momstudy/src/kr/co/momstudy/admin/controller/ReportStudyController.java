package kr.co.momstudy.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;

@WebServlet("/admin/reportoneStudy.do")
public class ReportStudyController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);

		res.setContentType("text/html;charset=UTF-8");
		
		int no = Integer.parseInt(req.getParameter("num"));
		System.out.println(no);
		PrintWriter out = res.getWriter();

		out.println(new Gson().toJson(dao.selectOneStudyReport(no)));

		out.close();
	}
}
