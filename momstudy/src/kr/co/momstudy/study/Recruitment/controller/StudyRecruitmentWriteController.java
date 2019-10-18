package kr.co.momstudy.study.Recruitment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.StudyRecruitmentDAO;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.StudyRecruitment;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.FileUpload;

@WebServlet("/study/studyrecruitmentwrite.do")
public class StudyRecruitmentWriteController extends HttpServlet {
	private StudyRecruitmentDAO dao;
	
	public StudyRecruitmentWriteController() {
		this.dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(StudyRecruitmentDAO.class);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		FileUpload fu = new FileUpload(req, "recruitment");
		fu.upload();
		
		MultipartRequest request =  fu.getRequest();
		
		StudyRecruitment str = new StudyRecruitment();
		
		str.setTitle(request.getParameter("title"));
		str.setContent(request.getParameter("content"));
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");	
		str.setEmail(user.getEmail());
		
		Study study = (Study)session.getAttribute("study");
		
		int categoryCode = study.getCategoryCode();
		str.setCategoryCode(categoryCode);
		
		int addressCode = study.getAddressCode();
		str.setAddressCode(addressCode);
		
		int studyNum = study.getNum();
		str.setStudyNum(studyNum);
		if(fu.getGroupCode() == null) {
			str.setFileGroupCode(1);			
		} else {
			str.setFileGroupCode(fu.getGroupCode());						
		}
		
		dao.insertStudyRecruitment(str);
		
		res.sendRedirect(req.getContextPath() + "/study/studyrecruitmentlist.do");
	}
}
