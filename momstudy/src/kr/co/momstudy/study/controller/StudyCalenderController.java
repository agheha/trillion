package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.util.Calender;

@WebServlet("/study/calender.do")
public class StudyCalenderController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Calender c = new Calender();
		int[] add;
		
		int year = Integer.parseInt(req.getParameter("year"));
		int month = Integer.parseInt(req.getParameter("month"));
		add = c.calmonth(year,month);
		Gson g = new Gson();
		PrintWriter out = resp.getWriter();
		out.println(g.toJson(add));
		out.close();
	}
	
}
