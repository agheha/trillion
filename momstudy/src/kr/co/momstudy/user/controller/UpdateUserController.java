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
import kr.co.momstudy.repository.vo.Address;
import kr.co.momstudy.repository.vo.Category;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.UserArea;
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
		String[] address = req.getParameterValues("userAddr");
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
		if (address != null) {
			dao.deleteUserAddressCode(user.getEmail());
			for (String val : address) {
				UserArea userArea = new UserArea();
				userArea.setEmail(user.getEmail());
				userArea.setAddressCode(Integer.parseInt(val));
				dao.insertAddress(userArea);
			}
		}
		List<Category> cateList = dao.selectCategory();
		List<Category> userCate = dao.selectUserCategoryCode(user.getEmail());
		List<UserArea> userArea = dao.selectUserArea(user.getEmail());
		List<Address> smallAddr = dao.selectSmallAddress();
		List<Address> bigAddr = dao.selectBigAddress();
		
		req.setAttribute("bigAddr",bigAddr);
		req.setAttribute("smallAddr",smallAddr);
		req.setAttribute("userArea", userArea);
		req.setAttribute("userCate", userCate);
		req.setAttribute("cateList", cateList);
		req.getRequestDispatcher("/user/userinfo.do").forward(req, res);
	}
}