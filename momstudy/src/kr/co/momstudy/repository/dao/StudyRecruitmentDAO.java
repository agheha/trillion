package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.StudyRecruitment;

public interface StudyRecruitmentDAO {
	
	// 스터디 모집글 리스트 전체 조회
	List<StudyRecruitment> selectStudyRecruitment();
	
	// 스터디 모집글 상세 조회
	StudyRecruitment selectOneStudyRecruitment(int strNum);
	
	// 스터디 모집글 등록
	void insertStudyRecruitment(StudyRecruitment str);
	
	// 스터디 모집글 수정
	void updateStudyRecruitment(StudyRecruitment str);
	
	// 스터디 모집글 삭제
	int deleteStudyRecruitment(int strNum);
	
	// 모집글 조회수 업데이트
	void updateViewCnt(int strNum);
} 
