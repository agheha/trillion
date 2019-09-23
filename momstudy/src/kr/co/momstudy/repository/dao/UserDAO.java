package kr.co.momstudy.repository.dao;

import kr.co.momstudy.repository.vo.User;

public interface UserDAO {
	
	//로그인 - 이메일 비밀번호 확인
	User selectLogin(User user);
	
}
