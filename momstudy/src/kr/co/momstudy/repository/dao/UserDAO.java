package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Address;
import kr.co.momstudy.repository.vo.Category;
import kr.co.momstudy.repository.vo.User;
import kr.co.momstudy.repository.vo.UserArea;
import kr.co.momstudy.repository.vo.UserCategory;

public interface UserDAO {
	
	// 로그인 - 이메일 비밀번호 확인
	User selectLogin(User user);
	// 회원가입 
	void insertUser(User user);
	// 관심분야 등록 
	void insertCategory(UserCategory userCate);
	// 관심분야 이름검색
	List<Category> selectCategory();
	// 이메일 찾기 
	User searchEmail(User user);
	// 비밀번호 찾기
	User searchPass(User user);
	// 유저 카테고리 코드 찾기
	List<Category> selectUserCategoryCode(String email);
	
	void deleteUserCategoryCode(String email);
	// 주소 대분류만 가져옴
	List<String> selectBigAddress();
	// 주소테이블 모든 데이터를 가져옴
	List<Address> selectSmallAddress();
	// 관심지역 등록
	void insertAddress(UserArea area);
	
}
