package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.Address;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.StudyRecruitment;
import kr.co.momstudy.util.PageResult;

@WebServlet("/study/studyrecruitmentlist.do")
public class StudyRecruitmentListController extends HttpServlet{
	private StudyRecruitmentDAO dao;
	private UserDAO uDao;
	
	public StudyRecruitmentListController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
		this.uDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// 카테고리 가져와서 공유영역에 올려줌
		List<String> cList = dao.categorySelect();
		req.setAttribute("cList", cList);
		
		// 스터디 등록을 위한 주소도 공유영역에 올려준다.
		List<Address> bigAList = uDao.selectBigAddress();
		req.setAttribute("bigAList", bigAList);
		
		
		String sPageNo = req.getParameter("PageNo");
		int pageNo = 1;
		int count = 0;
		if(sPageNo != null) {
			pageNo = Integer.parseInt(sPageNo);
		}
		
		// 디폴트를 작성일로 하고, 혹시 필터값을 사용자가 지정했다면 지정한 것으로 바꾼다.
		String filter = "regDate";
		if (req.getParameter("filter") != null) {	
			filter = req.getParameter("filter");
		}
		String type = req.getParameter("type");
		String keyword = req.getParameter("keyword");
		
		
		Search search = new Search(pageNo, 10);
		
		search.setTypes("제목", "글쓴이", "내용");
		search.setFilters("일자", "조회수", "별점");
		search.setFilter(filter);
		search.setKeyword(keyword);
		search.setType(type);
		
		// 받아온 카테고리 코드 있다면 Search 객체에 넣어준다
		if (req.getParameter("code") != null) {
			search.setCategoryCode(Integer.parseInt(req.getParameter("code")));			
		}

		List<StudyRecruitment> list = dao.selectStudyRecruitment(search);
		
		if(list.size() != 0) {
			count = list.get(0).getCount();
		}
		PageResult pr = new PageResult(
				pageNo, 		// 현재 페이지 번호
				count,		    // 게시물 전체 갯수
				10,				// 보여줄 게시물 갯수
				10				// 보여줄 페이징 갯수
				);
		req.setAttribute("list", list);
		req.setAttribute("search", search);
		req.setAttribute("pr", pr);
		RequestDispatcher rd = req.getRequestDispatcher("/jsp/study/studyrecruitmentlist.jsp");
		rd.forward(req, res);
	}
}
