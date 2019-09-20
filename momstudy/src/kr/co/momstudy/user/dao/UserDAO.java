package kr.co.momstudy.user.dao;

import kr.co.momstudy.user.vo.User;

public interface UserDAO {
	
	//로그인 - 이메일 비밀번호 확인
	User selectLogin(User user);
	
}
