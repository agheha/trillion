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
		
		String categoryCode = req.getParameter("categoryCode");
		String type = req.getParameter("type");
		String reportTarget = req.getParameter("reportTarget");
		String boardNum = req.getParameter("boardNum");
		String content = req.getParameter("content");
		String code = req.getParameter("code");
		String email = req.getParameter("email");
		String boardType = req.getParameter("boardType");
		String studyNum = req.getParameter("studyNum");
		
		System.out.println(boardNum);
		if(categoryCode != null) {
			report.setCategoryCode(categoryCode);
		}
		if(type != null) {
			report.setType(type);
		}
		if(reportTarget != null) {
			report.setReportTarget(reportTarget);
		}
		if(boardNum != null) {
			report.setBoardNum(Integer.parseInt(boardNum));
		}
		if(content != null) {
			report.setContent(content);
		}
		if(code != null) {
			report.setCode(Integer.parseInt(code));
		}
		if(email != null) {
			report.setEmail(email);
		}
		if(boardType != null) {
			report.setBoardType(boardType);
		}
		if(studyNum != null) {
			report.setStudyNum(Integer.parseInt(studyNum));
		}
		
		
		int p = dao.insertReport(report);
			
		PrintWriter out = res.getWriter();
		out.println(p);// 받아와서 1이면은 신고 되었습니다. 2팝업에 띄워주고 0 이면 신고하지 못하였습니다. 2팝업에 띄워주기
		out.close();
		
		
	}     

}
