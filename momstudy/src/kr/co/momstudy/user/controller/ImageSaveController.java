package kr.co.momstudy.user.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.momstudy.common.db.MyAppSqlConfig;
import kr.co.momstudy.repository.dao.FileDAO;
import kr.co.momstudy.repository.dao.UserDAO;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.util.FileUpload;

@WebServlet("/user/myimg.do")
public class ImageSaveController extends HttpServlet{
    FileDAO dao;
    UserDAO userDao;
    @Override
    public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        dao = MyAppSqlConfig.getSqlSessionInstance().getMapper(FileDAO.class);
        userDao = MyAppSqlConfig.getSqlSessionInstance().getMapper(UserDAO.class);
        FileUpload fu = new FileUpload(req, req.getParameter("path"));
        fu.upload();
        User user = (User)req.getSession().getAttribute("user");
        User u = new User();
        u.setEmail(user.getEmail());
        u.setFileGroupCode(fu.getGroupCode());
        user.setFileGroupCode(fu.getGroupCode());
        //그룹코드 등록
        userDao.updateImgCode(u);
        req.getRequestDispatcher("/user/userinfo.do").forward(req, res);
    }
    
}