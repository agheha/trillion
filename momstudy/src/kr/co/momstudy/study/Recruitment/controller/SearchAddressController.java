package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.Address;

@WebServlet("/study/searchaddress.do")
public class SearchAddressController extends HttpServlet{
	StudyRecruitmentDAO dao;
	public SearchAddressController() {
		 this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8"); 
		
		String[] arr = req.getParameter("code").split(",");
		int[] codes = new int[arr.length];
		for (int i = 0; i < arr.length; i++) {
			codes[i] = Integer.parseInt(arr[i]);
		}
		
		
		
	}
}
