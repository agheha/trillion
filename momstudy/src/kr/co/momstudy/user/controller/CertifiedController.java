package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.repository.vo.User;

@WebServlet("/user/certified.do")
public class CertifiedController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String certified = req.getParameter("certified") ;
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("user");
		
		if (!user.getCertifiedCode().equals(certified) && !user.getName().equals(req.getParameter("name")) && !user.getEmail().equals(req.getParameter("email"))) {
			res.sendRedirect(req.getContextPath() + "/jsp/user/findform.jsp");
		}
		req.getRequestDispatcher("/main.do").forward(req, res);
		
	}
}
