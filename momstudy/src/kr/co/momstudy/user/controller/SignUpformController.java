package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/user/signupform.do")
public class SignUpformController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String[] cateList = {"IT","자격증", "언어", "운동", "취미", "예술", "음악", "기초학문"};
		req.setAttribute("cateList",cateList);
		req.getRequestDispatcher("/jsp/user/signupform.jsp").forward(req, res);
	}
}
