package kr.co.momstudy.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.AdminDAO;
import kr.co.momstudy.repository.vo.Report;
import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.util.PageResult;

@WebServlet("/admin/reportuser.do")
public class ReportUserListController extends HttpServlet {
	AdminDAO dao;

	public ReportUserListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(AdminDAO.class);
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html;charset=UTF-8");
		String no = req.getParameter("no");

		if (no == null) {
//			페이징 + 검색 쿼리
			String sPageNo = req.getParameter("pageNo");
			int pageNo = 1;
			int count = 0;
			if(sPageNo != null) {
				pageNo = Integer.parseInt(sPageNo);
			}
			
			String filter = "regDate";
			if (req.getParameter("filter") != null) {	
				filter = req.getParameter("filter");
			}
			String type = req.getParameter("type");
			String keyword = req.getParameter("keyword");
			
			Search search = new Search(pageNo ,3);
			search.setTypes("신고된 사람","신고사유");
			search.setFilters("일자","신고된 횟수","신고사유");
			search.setFilter(filter);
			search.setKeyword(keyword);
			search.setType(type);
			
			List<Report> list = dao.selectUserReport(search);
			
			if(list.size() != 0) {
				count = list.get(0).getCnt();
			}
			System.out.println(count);
			PageResult pr = new PageResult(
					pageNo,				// 현재 페이지 번호
					count,				// 게시물 전체 갯수
					3,					// 보여줄 게시물 갯수
					10					// 보여줄 페이징 갯수
					);
			
			req.setAttribute("search", search);
			req.setAttribute("pr", pr);
		
			req.setAttribute("list", list);
			req.getRequestDispatcher("/jsp/admin/reportuser.jsp").forward(req, res);

		} else {
			int num = Integer.parseInt(no);
			Report report = dao.selectOneUserReport(num);

			PrintWriter out = res.getWriter();
			out.println(new Gson().toJson(report));
			out.close();
		}

	}
}
