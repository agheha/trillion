package kr.co.momstudy.study.calender.controller;

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
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Calenders;
import kr.co.momstudy.repository.vo.Schedule;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.util.Calender;

@WebServlet("/study/calender.do")
public class CalenderController extends HttpServlet{
	StudyDAO dao;
	public CalenderController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		
		//날짜정보를 가져옴
		Calender c = new Calender();
		String[] dates;
		
		int year = Integer.parseInt(req.getParameter("year"));
		int month = Integer.parseInt(req.getParameter("month"));
		dates= c.calmonth(year,month);
		
		//일정을 가져옴
		Calenders calender = new Calenders();
		Study study = (Study)req.getSession().getAttribute("study");
		
		
		calender.setStudyNo(study.getNum());
		calender.setStstart(dates[0]);
		calender.setStend(dates[dates.length-1]);
		
		List<Calenders> clist = dao.selectCalender(calender);
		
		Schedule sd = new Schedule();
		
		sd.setList(clist);
		sd.setDates(dates);
		
		Gson g = new Gson();
		PrintWriter out = resp.getWriter();
		out.println(g.toJson(sd));
		out.close();
	}
	
}
