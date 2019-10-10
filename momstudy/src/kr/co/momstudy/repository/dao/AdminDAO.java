package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Report;
import kr.co.momstudy.repository.vo.Study;
import kr.co.momstudy.repository.vo.User;

public interface AdminDAO {

//	유저신고 정보 뽑아오는데 +신고 횟수+신고사유
	List<Report> selectUserReport();
	
//	1개 유저신고 정보 뽑아오는데 +신고 횟수+신고사유
	Report selectOneUserReport(int num);
	
//	글신고 정보 뽑아 오는 데 + 신고횟수 +신고사유
	List<Report> selectBoardReport();
	
//	1개 글 정보 뽑아 오는 데 + 신고횟수 +신고사유
	Report selectOneBoardReport(int num);
	
//	스터디신고 정보 뽑아 오는 데 + 신고횟수 +신고사유
	List<Report> selectStudyReport();
	
//	1개 스터디신고 정보 뽑아 오는 데 + 신고횟수 +신고사유
	Report selectOneStudyReport(int num);
	
//	스터디+소속 팀원수
	List<Study> selectStudy();
	
//	아이디 받아서 그사람이 개설한 스터디  + 팀원 수
	List<Study> selectPeopleOpenStudy(String email);
	
//	아이디 받아서 그사람이 가입한 스터디 + 팀원수
	List<Study> selectPeopleJoinStudy(String email);
	
//	유저정보+가입스터디수 +개설 스터디수
	List<User> selectUserInfo();

}
