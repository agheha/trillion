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
		
		System.out.println("categoryCode: "+categoryCode);
		System.out.println("type: "+type);
		System.out.println("reportTarget: "+reportTarget);
		System.out.println("boardNum: "+boardNum);
		System.out.println("content: "+content);
		System.out.println("code: "+code);
		System.out.println("email: "+email);
		System.out.println("boardType: "+boardType);
		System.out.println("studyNum: "+studyNum);
		
		//
		if(categoryCode.equals("undefined") || categoryCode.equals("")){
			report.setCategoryCode(null);
		}
		else if(categoryCode != null ) {
			report.setCategoryCode(categoryCode);
		}
		//
		if(type.equals("undefined") || type.equals("")) {
			report.setType(null);
		}
		else if(type != null) {
			report.setType(type);
		}
		//
		if(reportTarget.equals("undefined") || reportTarget.equals("")) {
			report.setReportTarget(null);
		}
		else if(reportTarget != null) {
			report.setReportTarget(reportTarget);
		}
		//
		if(boardNum.equals("undefined") || boardNum.equals("")) {
			report.setBoardNum(null);
		}
		else if(boardNum != null) {
			report.setBoardNum(Integer.parseInt(boardNum));
		}
		//
		if(content.equals("undefined") || content.equals("")) {
			report.setContent(null);
		}
		else if(content != null) {
			report.setContent(content);
		}
		//
		if(code.equals("undefined") || code.equals("")) {
			report.setCode(null);
		}
		else if(code != null) {
			report.setCode(Integer.parseInt(code));
		}
		//
		if(email.equals("undefined") || email.equals("")) {
			report.setEmail(null);
		}
		else if(email != null) {
			report.setEmail(email);
		}
		//
		if(boardType.equals("undefined") || boardType.equals("")) {
			report.setBoardType(null);
		}
		else if(boardType != null) {
			report.setBoardType(boardType);
		}
		//
		if(studyNum.equals("undefined") || studyNum.equals("")) {
			report.setStudyNum(null);
		}
		else if(studyNum != null) {
			report.setStudyNum(Integer.parseInt(studyNum));
		}
		
		
		int p = dao.insertReport(report);
			
		PrintWriter out = res.getWriter();
		out.println(p);// 받아와서 1이면은 신고 되었습니다. 2팝업에 띄워주고 0 이면 신고하지 못하였습니다. 2팝업에 띄워주기
		out.close();
		
		
	}     

}
