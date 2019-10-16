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
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Address;
import kr.co.momstudy.repository.vo.Study;

@WebServlet("/study/studyupdateform.do")
public class StudyUpdateFormController extends HttpServlet{
	private StudyRecruitmentDAO dao;
	private UserDAO uDao;
	public StudyUpdateFormController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
		this.uDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		Study study = (Study)req.getSession().getAttribute("study");
		
		List<String> cList = dao.categorySelect();
		List<Address> bigAList = uDao.selectBigAddress();
		List<Object> list = new ArrayList<>();
		list.add(study);
		list.add(cList);
		list.add(bigAList);
		
		Gson g = new  Gson();
		String json = g.toJson(list);
		PrintWriter out = resp.getWriter();
		out.println(json);
		out.close();
	}
}
