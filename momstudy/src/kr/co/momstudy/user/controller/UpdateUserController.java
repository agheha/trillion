package kr.co.momstudy.user.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Category;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.UserCategory;

@WebServlet("/user/updateinfo.do")
public class UpdateUserController extends HttpServlet{
	private UserDAO dao;
	
	public UpdateUserController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String[] category = req.getParameterValues("category");
		HttpSession session = req.getSession();
		
		User user = (User)session.getAttribute("user");
		if (category != null) {
			dao.deleteUserCategoryCode(user.getEmail());
			for (String val : category) {
				UserCategory userCategory = new UserCategory();
				userCategory.setEmail(user.getEmail());
				userCategory.setCategoryCode(Integer.parseInt(val));
				dao.insertCategory(userCategory);			
			}
		}
		List<Category> cateList = dao.selectCategory();
		List<Category> userCate = dao.selectUserCategoryCode(user.getEmail());
		req.setAttribute("userCate", userCate);
		req.setAttribute("cateList", cateList);
		req.getRequestDispatcher("/jsp/user/userinfo.jsp").forward(req, res);
	}
}