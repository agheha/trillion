package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyDAO;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/mypage.do")
public class MypageController extends HttpServlet{
	StudyDAO dao;
	UserDAO userdao;
	public MypageController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyDAO.class);
		this.userdao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		List<Study> slist = dao.selectStudy(user.getEmail());
		List<Participant> parList = userdao.selectMyStudy(user.getEmail());
		req.setAttribute("parlist", parList);
		req.setAttribute("slist", slist);
		req.getRequestDispatcher("/jsp/user/mypage.jsp").forward(req, res);
		
	}
}