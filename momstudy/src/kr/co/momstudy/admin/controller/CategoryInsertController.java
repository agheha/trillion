package kr.co.momstudy.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;

@WebServlet("/admin/categoryinsert.do")
public class CategoryInsertController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
	
	
	resp.setContentType("text/html;charset=UTF-8");
	req.setCharacterEncoding("UTF-8");
	
	dao.insertCategory(req.getParameter("categoryName"));
	resp.sendRedirect("/momstudy/admin/admincategory.do");
	}

}
