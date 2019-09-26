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
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.VoteResult;

@WebServlet("/study/voteresultdetail.do")
public class VoteResultDetailController extends HttpServlet{
		VoteDAO dao;
		
		
	public VoteResultDetailController() {
			this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
		}


	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		int code = Integer.parseInt(req.getParameter("code"));
		List<VoteResult> vrlist = dao.selectResult(code);
		req.setAttribute("vrlist", vrlist);
		req.setAttribute("content", dao.selectAricleContent(code));
		
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/voteresultdetail.jsp");
		rd.forward(req, res);
	}
	
}
