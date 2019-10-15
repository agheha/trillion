package kr.co.momstudy.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/admin/banrelease.do")
public class UserBanReleaseController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
		
	 User user = new User();
	 user.setEmail(req.getParameter("email"));
	
	dao.updateBanRelease(user);

	resp.sendRedirect(req.getContextPath() + "/admin/reportuser.do");
	}

}
