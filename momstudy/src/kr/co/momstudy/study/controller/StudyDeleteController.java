package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.Study;

@WebServlet("/study/studydelete.do")
public class StudyDeleteController extends HttpServlet {
	StudyDAO dao;

	public StudyDeleteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Study study = (Study) req.getSession().getAttribute("study");

		int num = study.getNum();

		PrintWriter out = resp.getWriter();

		if (dao.selectStudyInfo(num).getMember() > 1) {
			out.println("1");
		} else {
			dao.deleteStudy(num);
			out.println("2");
		}
		out.close();
	}
}
