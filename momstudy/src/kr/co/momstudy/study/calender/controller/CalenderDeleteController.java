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
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.Calender;

@WebServlet("/study/deleteschedule.do")
public class CalenderDeleteController extends HttpServlet{
	StudyDAO dao;
	public CalenderDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		User user = (User)req.getSession().getAttribute("user");
		int num = Integer.parseInt(req.getParameter("num"));
		PrintWriter out = resp.getWriter();
		if(user.getEmail().equals(dao.selectOneCalender(num).getEmail())) {
			dao.deleteCalender(num);
			out.println("1");
			out.close();
			return;			
		}
		
		out.println("2");
		out.close();
	}
	
}
