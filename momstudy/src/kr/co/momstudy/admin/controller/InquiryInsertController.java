package kr.co.momstudy.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.QuestionDAO;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.Question;

@WebServlet("/admin/inquiryinsert.do")
public class InquiryInsertController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		QuestionDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QuestionDAO.class);
		res.setContentType("text/html;charset=UTF-8");
		
		System.out.println(req.getParameter("Qademail"));
		System.out.println(req.getParameter("commentGroupCode"));
		System.out.println(req.getParameter("Qcontent"));
		
		Comment comment =  new Comment();
		comment.setEmail(req.getParameter("Qademail"));
		comment.setCommentGroupCode(Integer.parseInt(req.getParameter("commentGroupCode")));
		comment.setContent(req.getParameter("Qcontent"));
		
		int fac = dao.insertQcoment(comment);
		
		if( fac == 1) {
			dao.QconditionUpdate(comment);
		}

	
		res.sendRedirect("/momstudy/admin/admininquiry.do");
	}
}
