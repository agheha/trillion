package kr.co.momstudy.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

@WebServlet("/admin/userdtail.do")
public class UserDtailController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html;charset=UTF-8");
		req.setCharacterEncoding("UTF-8");

		AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);

		String email = req.getParameter("email");

		User user = dao.selectOneUserInfo(email);

		List<Study> openStudy = dao.selectPeopleOpenStudy(email);

		List<Study> joinStudy = dao.selectPeopleJoinStudy(email);

		HashMap<String, Object> map = new HashMap<>();
		map.put("user", user);
		map.put("openStudy", openStudy);
		map.put("joinStudy", joinStudy);
		PrintWriter out = res.getWriter();

		out.println(new Gson().toJson(map));

		out.close();
	}
}
