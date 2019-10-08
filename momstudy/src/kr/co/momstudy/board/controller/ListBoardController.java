package kr.co.momstudy.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.BoardDAO;
import kr.co.momstudy.repository.vo.Board;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.util.PageResult;
@WebServlet("/board/list.do")
public class ListBoardController extends HttpServlet {
	
	private BoardDAO dao;
	public ListBoardController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(BoardDAO.class);
	}
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	/*
    	String bPageNo = req.getParameter("pageNo");
    	
    	// 요청 페이지를 1페이지로 변경
    	int pageNo = 1;
    	int count = 0;
    	if (bPageNo != null) {
    		pageNo = Integer.parseInt(bPageNo);
    	}
    	Page page = new Page(pageNo);
    	
    	List<Board> blist = dao.selectBoard(page);
    	
    	req.setAttribute("list", blist);
    	if(blist.size() !=0) {
    		count = blist.get(0).getCnt();
    	}
    	
    	
    	PageResult pr = new PageResult(pageNo, count);
    	req.setAttribute("pr", pr);
    	*/
    	// 데이터를 구하고 공유 영역에 올림
      
      
      String bPageNo = req.getParameter("pageNo");
      int pageNo = 1;
      int count = 0;
      if(bPageNo != null) {
    	  pageNo = Integer.parseInt(bPageNo);
      }
      String filter = "regDate";
      String type = req.getParameter("type");
      String keyword = req.getParameter("keyword");
      
      Search search = new Search(pageNo);
      
      search.setTypes("제목", "글쓴이");
      search.setFilter("일자");
      search.setFilter(filter);
      search.setKeyword(keyword);
      search.setType(type);
      
      List<Board> list = dao.selectBoard(search);
      
      if(list.size() != 0 ) {
    	  count = list.get(0).getCnt();
      }
      PageResult pr = new PageResult(pageNo, count);
      req.setAttribute("list", list);
      req.setAttribute("pr", pr);
      req.setAttribute("search", search);
      req.getRequestDispatcher("/jsp/board/list.jsp").forward(req, res);
    }	
 
}
