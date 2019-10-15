package kr.co.momstudy.question.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.QuestionDAO;
import kr.co.momstudy.repository.vo.Question;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.PageResult;

@WebServlet("/question/questionform.do")
public class QuestionformController extends HttpServlet {
	private QuestionDAO dao;
	
	public QuestionformController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(QuestionDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		User user = (User)req.getSession().getAttribute("user");
		
		String sPageNo = req.getParameter("pageNo");
		int pageNo = 1;
		int count = 0;
		if(sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		
		String filter = "regDate";
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		Search search = new Search(pageNo);
		
		search.setTypes("제목","글쓴이");
		search.setFilters("일자");
		search.setEmail(user.getEmail());
		search.setFilter(filter);
		search.setKeyword(keyword);
		search.setType(type);
		
		List<Question> queList = dao.selectQuestion(search);
		
		if(queList.size() != 0) {
			count = queList.get(0).getCnt();
		}
		PageResult pr = new PageResult(pageNo,count);
		req.setAttribute("vlist", queList);
		req.setAttribute("pr", pr);
		req.setAttribute("search", search);
		req.setAttribute("quelist", queList );
		req.getRequestDispatcher("/jsp/question/questionform.jsp").forward(req, res);
	}
	
}
