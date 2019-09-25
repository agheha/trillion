package kr.co.momstudy.study.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.VoteDAO;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.VoteResult;

@WebServlet("/study/vote.do")
public class VoteController extends HttpServlet {
	VoteDAO dao;

	public VoteController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(VoteDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		
		String[] aricles = req.getParameterValues("aricle");
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		int num = Integer.parseInt(req.getParameter("num"));
		if (aricles != null) {
			for (String aricle : aricles) {
				VoteResult vr = new VoteResult();
				vr.setCode(Integer.parseInt(aricle));
				vr.setEmail(user.getEmail());
				dao.insertVoteResult(vr);
			}
		}
		
		
		
		resp.sendRedirect("/momstudy/study/voteresult.do?num=" + num);
	}

}
