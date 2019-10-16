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
import kr.co.momstudy.repository.dao.QuestionDAO;
import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.Question;

@WebServlet("/admin/adminoneinquiry.do")
public class InquiryOneController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		QuestionDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QuestionDAO.class);
		res.setContentType("text/html;charset=UTF-8");
		
		int num = Integer.parseInt(req.getParameter("num"));
		
		Question Quest = dao.selectAdminOneQuestion(num);
		
		List<Comment> clist = dao.selectAdminQuestioncomment(num);

		HashMap<String, Object> map = new HashMap<>();
		map.put("Quest", Quest);
		map.put("clist", clist);

		PrintWriter out = res.getWriter();

		out.println(new Gson().toJson(map));

		out.close();
	}
}
