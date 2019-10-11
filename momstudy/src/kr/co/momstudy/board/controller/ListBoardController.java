package kr.co.momstudy.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
      HttpSession session = req.getSession();
      Study study = (Study)session.getAttribute("study");
      int studyNum = study.getNum();
      System.out.println("찍혔냐?" + studyNum);
           
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
      search.setStudyNum(studyNum);
      
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
