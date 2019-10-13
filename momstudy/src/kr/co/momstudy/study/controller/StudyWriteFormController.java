package kr.co.momstudy.study.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Address;
import kr.co.momstudy.repository.vo.Category;

@WebServlet("/study/studywriteform.do")
public class StudyWriteFormController extends HttpServlet{
	private UserDAO udao;
	public StudyWriteFormController() {
		this.udao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Category> cList = udao.selectCategory();
		List<Address> bigAList = udao.selectBigAddress();
		req.setAttribute("cList", cList);
		req.setAttribute("bigAList", bigAList);
		RequestDispatcher rd =  req.getRequestDispatcher("/jsp/study/studywriteform.jsp");
		rd.forward(req, resp);
	}
	
}
