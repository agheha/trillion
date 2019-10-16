package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Address;
import kr.co.momstudy.repository.vo.Study;

@WebServlet("/study/studyupdate.do")
public class StudyUpdateController extends HttpServlet{
	private StudyDAO dao;
	public StudyUpdateController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		Study study = (Study)req.getSession().getAttribute("study");
		study.setName(req.getParameter("name"));
		study.setAddressCode(Integer.parseInt(req.getParameter("addressCode")));
		study.setCategoryCode(Integer.parseInt(req.getParameter("categoryCode")));
		dao.updateStudy(study);
	}
}
