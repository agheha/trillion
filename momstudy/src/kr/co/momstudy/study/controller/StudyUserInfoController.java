package kr.co.momstudy.study.controller;

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
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Score;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/study/userinfo.do")
public class StudyUserInfoController extends HttpServlet {
	UserDAO dao;
	StudyDAO sdao;

	public StudyUserInfoController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
		sdao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		User user = dao.selectFindLogin(email);
		List<Score> slist = sdao.selectScore(email);
		Gson g = new Gson();
		String scores = g.toJson(slist);
		PrintWriter out = resp.getWriter();
		out.println(scores);
		out.close();

	}

}
