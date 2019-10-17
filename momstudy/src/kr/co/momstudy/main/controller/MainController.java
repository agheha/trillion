package kr.co.momstudy.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.StudyRecruitment;

@WebServlet("/main.do")
public class MainController extends HttpServlet{
	private StudyRecruitmentDAO dao;

	public MainController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HashMap<String,Integer> cntmap = dao.selectMainCnt();
		List<StudyRecruitment> viewCnt = dao.viewSeeCnt();
		List<StudyRecruitment> viewUserCnt = dao.viewUserCnt();
		List<StudyRecruitment> viewLatestdate = dao.viewLatestdate();
		req.setAttribute("viewcnt", viewCnt);
		req.setAttribute("viewusercnt", viewUserCnt);	
		req.setAttribute("viewlatestdate", viewLatestdate);
		req.setAttribute("cntmap", cntmap);
		req.getRequestDispatcher("/jsp/main/main.jsp").forward(req, res);
	}
}
