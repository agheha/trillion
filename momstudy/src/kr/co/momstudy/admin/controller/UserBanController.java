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

@WebServlet("/admin/ban.do")
public class UserBanController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
		
	 User user = new User();
	 user.setBan(Integer.parseInt(req.getParameter("banDate")));
	 user.setEmail(req.getParameter("email"));
	
	
	dao.updateBanDate(user);

	resp.sendRedirect(req.getContextPath() + "/admin/reportuser.do");
	}

}
