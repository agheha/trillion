package kr.co.momstudy.study.Recruitment.controller;

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
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Address;

@WebServlet("/study/selectedaddress.do")
public class SelectedAddressController extends HttpServlet{
	UserDAO dao;
	public SelectedAddressController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8"); 
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		Address addr = dao.selectAddressNum(num);
		
		Gson g = new  Gson();
		String json = g.toJson(addr);
		PrintWriter out = resp.getWriter();
		out.println(json);
		out.close();
	}
}
