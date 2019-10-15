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
import kr.co.momstudy.repository.vo.Report;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.util.PageResult;


@WebServlet("/admin/reportboard.do")
public class ReportBoardListController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		AdminDAO dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);

		res.setContentType("text/html;charset=UTF-8");

//		페이징 + 검색 쿼리
		String sPageNo = req.getParameter("pageNo");
		int pageNo = 1;
		int count = 0;
		int postCnt = 3; // 보여줄 개시물 갯수

		if (sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}

		String filter = "regDate";
		if (req.getParameter("filter") != null) {
			filter = req.getParameter("filter");
		}
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");

		Search search = new Search(pageNo, postCnt);
		search.setTypes("제목", "이메일");
		search.setFilters("일자","신고된 횟수","신고사유");
		search.setFilter(filter);
		search.setKeyword(keyword);
		search.setType(type);

		List<Report> list = dao.selectBoardReport(search);

		if (list.size() != 0) {
			count = list.get(0).getCnt();
		}
		System.out.println(count);
		PageResult pr = new PageResult(pageNo, // 현재 페이지 번호
				count, // 게시물 전체 갯수
				postCnt, // 보여줄 게시물 갯수
				10 // 보여줄 페이징 갯수
		);

		req.setAttribute("search", search);
		req.setAttribute("pr", pr);

		req.setAttribute("list", list);
		req.getRequestDispatcher("/jsp/admin/reportboard.jsp").forward(req, res);
	}
}
