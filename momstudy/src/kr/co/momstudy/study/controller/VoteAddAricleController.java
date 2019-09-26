package kr.co.momstudy.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.VoteAricle;

@WebServlet("/study/addaricle.do")
public class VoteAddAricleController extends HttpServlet{
	VoteDAO dao;
	public VoteAddAricleController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int num = Integer.parseInt(req.getParameter("num"));
		String content = req.getParameter("addAricle");
		System.out.println(content);
		System.out.println(num);
		VoteAricle va = new VoteAricle();
		va.setNum(num);
		va.setContent(content);
		dao.insertVoteAricle(va);
		
		resp.sendRedirect(req.getContextPath() + "/study/detailvote.do?num=" + num );
		
		
		
	}
	
}
