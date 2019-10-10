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

@WebServlet("/user/userinfo.do")
public class UserInfoController extends HttpServlet{
	private UserDAO dao;
	
	public UserInfoController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		List<Category> cateList = dao.selectCategory();
		List<Category> userCate = dao.selectUserCategoryCode(user.getEmail());
		List<UserArea> userArea = dao.selectUserArea(user.getEmail());
		List<Address> smallAddr = dao.selectSmallAddress();
		List<Address> bigAddr = dao.selectBigAddress();
		System.out.println(user.getFileGroupCode());
		req.setAttribute("bigAddr",bigAddr);
		req.setAttribute("smallAddr",smallAddr);
		req.setAttribute("userArea", userArea);
		req.setAttribute("userCate", userCate);
		req.setAttribute("cateList", cateList);
		req.getRequestDispatcher("/jsp/user/userinfo.jsp").forward(req, res);
	}
}