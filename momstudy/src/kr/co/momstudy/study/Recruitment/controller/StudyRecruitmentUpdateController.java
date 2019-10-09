package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.StudyRecruitment;
import kr.co.momstudy.util.FileUpload;

@WebServlet("/study/studyrecruitmentupdate.do")
public class StudyRecruitmentUpdateController extends HttpServlet{

	private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentUpdateController() {
		dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		FileUpload fu = new FileUpload(req, "studyrecruitment");
		fu.upload();
		MultipartRequest request =  fu.getRequest();
		
		int strNum = Integer.parseInt(req.getParameter("num"));
		StudyRecruitment str = dao.selectOneStudyRecruitment(strNum);
		
		str.setTitle(request.getParameter("title"));
		str.setContent(request.getParameter("content"));
		str.setFileGroupCode(fu.getGroupCode());
		
		dao.updateStudyRecruitment(str);
        
		res.sendRedirect(req.getContextPath() + "/study/studyrecruitmentlist.do");
		
	}
}
