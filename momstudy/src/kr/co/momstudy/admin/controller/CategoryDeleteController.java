package kr.co.momstudy.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;

@WebServlet("/admin/categorydelete.do")
public class CategoryDeleteController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");
		
		String[] list = req.getParameterValues("categoryCode");
		
		for(int i=0;i<list.length;i++) {
			dao.deleteCategory(Integer.parseInt(list[i]));
		}
		
		
		res.sendRedirect("/momstudy/admin/admincategory.do");
	}

}
