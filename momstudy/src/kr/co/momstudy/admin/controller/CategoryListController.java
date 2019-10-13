package kr.co.momstudy.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;
@WebServlet("/admin/admincategory.do")
public class CategoryListController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminDAO dao =MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
		
		 req.setAttribute("list",  dao.selectCategory());
		 req.getRequestDispatcher("/jsp/admin/admincategory.jsp").forward(req, res);
	}
}
