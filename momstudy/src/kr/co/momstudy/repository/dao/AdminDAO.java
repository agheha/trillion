package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.AdminCategory;
import kr.co.momstudy.repository.vo.Report;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

public interface AdminDAO {

//	유저신고 정보 뽑아오는데 +신고 횟수+신고사유
	List<Report> selectUserReport(Search search);
	
//	1개 유저신고 정보 뽑아오는데 +신고 횟수+신고사유
	Report selectOneUserReport(int num);
	
//	글신고 정보 뽑아 오는 데 + 신고횟수 +신고사유
	List<Report> selectBoardReport(Search search);
	
//	1개 글 정보 뽑아 오는 데 + 신고횟수 +신고사유
	Report selectOneBoardReport(int num);
	
//	스터디신고 정보 뽑아 오는 데 + 신고횟수 +신고사유
	List<Report> selectStudyReport(Search search);
	
//	1개 스터디신고 정보 뽑아 오는 데 + 신고횟수 +신고사유
	Report selectOneStudyReport(int num);
	
//	스터디+소속 팀원수
	List<Study> selectStudy(Search search);
	
//	아이디 받아서 그사람이 개설한 스터디  + 팀원 수
	List<Study> selectPeopleOpenStudy(String email);
	
//	아이디 받아서 그사람이 가입한 스터디 + 팀원수
	List<Study> selectPeopleJoinStudy(String email);
	
//	유저정보+가입스터디수 +개설 스터디수
	List<User> selectUserInfo(Search search);
	
//	아이디 받아서 유저정보+가입스터디수 +개설 스터디수
	User selectOneUserInfo(String email);
	
//	정보받아서 신고
	int insertReport(Report report);

//	총 카테고리 +개설 스터디수
	List<AdminCategory> selectCategory();
//	카테고리 이름 받아서 추가
	int insertCategory(String categoryName);
//	카테고리 번호 받아서 삭제
	int deleteCategory(int categoryCode);
//	아이디 받아서 밴기간 설정
	int updateBanDate(User user);
}
