package kr.co.momstudy.study.calender.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Calenders;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/insertschedual.do")
public class CalenderInsertController extends HttpServlet{
	StudyDAO dao;
	public CalenderInsertController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Study study = (Study)req.getSession().getAttribute("study");
		User user = (User)req.getSession().getAttribute("user");
		Calenders c = new Calenders();
		
		c.setEmail(user.getEmail());
		c.setFontColor(req.getParameter("fontcolor"));
		c.setBarColor(req.getParameter("barcolor"));
		c.setEndDate(req.getParameter("end").replace("-", ""));
		c.setStartDate(req.getParameter("start").replace("-", ""));
		c.setContent(req.getParameter("content"));
		c.setTitle(req.getParameter("title"));
		c.setType(Integer.parseInt(req.getParameter("caltype")));
		c.setStudyNo(study.getNum());
		
		dao.insertCalender(c);
		
	}
	
}
