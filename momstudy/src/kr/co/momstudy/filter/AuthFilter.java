package kr.co.momstudy.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.co.momstudy.repository.vo.User;

public class AuthFilter implements Filter{
	private List<String> list = new ArrayList<>();
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		String[] pages = config.getInitParameter("pages").split(";");
		for (String page : pages) {
			list.add(page.trim());
		}
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest)request;
		HttpServletResponse res = (HttpServletResponse)response;
	
		String uri = req.getRequestURI();
		String contextPath = req.getContextPath();
		uri = uri.substring(contextPath.length());
		
		int index = list.indexOf(uri);
		
//		if(index == -1) {		
//			HttpSession session = req.getSession();
//			User user = (User)request.getAttribute("user");
//			if (user== null) {
//				res.sendRedirect(req.getContextPath() + "/user/loginform.do");
//				return;
//			}
//		}
		// 로그인 체크 통과된 경우...
		chain.doFilter(request, response);
	}
}
