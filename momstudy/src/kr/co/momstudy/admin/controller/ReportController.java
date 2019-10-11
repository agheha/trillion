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
import kr.co.momstudy.repository.vo.Report;

@WebServlet("/admin/report.do")
public class ReportController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
	
		Report report = new Report();
		
		report.setType(req.getParameter("type"));
		report.setBoardType(req.getParameter("boardType"));
		report.setReportTarget( req.getParameter("reportTarget"));
		report.setBoardNum(Integer.parseInt(req.getParameter("boardNum")));
		report.setStudyNum(Integer.parseInt(req.getParameter("studyNum")));
		report.setContent(req.getParameter("content"));
		report.setCode(Integer.parseInt(req.getParameter("code")));
		report.setEmail(req.getParameter("email"));
		
		int p = dao.insertReport(report);
			
		PrintWriter out = res.getWriter();
		out.println(p);// 받아와서 1이면은 신고 되었습니다. 2팝업에 띄워주고 0 이면 신고하지 못하였습니다. 2팝업에 띄워주기
		out.close();
		
		
	}     

}
