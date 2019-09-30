package kr.co.momstudy.study.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/study/studymain.do")
public class StudyMainController extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int snum = Integer.parseInt(req.getParameter("num"));
		req.getSession().setAttribute("snum", snum);
		RequestDispatcher rd = req.getRequestDispatcher("/study/jsp/studymain.jsp");
		rd.forward(req, resp);
	}
	
}
