package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.StudyRecruitment;

public interface StudyRecruitmentDAO {
	
	// 스터디 모집글 리스트 전체 조회
	List<StudyRecruitment> selectStudyRecruitment(Search search);
	
	// 스터디 모집글 상세 조회
	StudyRecruitment selectOneStudyRecruitment(int recNum);
	
	// 스터디 모집글 등록
	void insertStudyRecruitment(StudyRecruitment rec);
	
	// 스터디 모집글 수정
	void updateStudyRecruitment(StudyRecruitment rec);
	
	// 조회수 증가
	void updateViewCnt(int no);
	
	// 스터디 모집글 삭제
	void deleteStudyRecruitment(int strNum);
	
} 
