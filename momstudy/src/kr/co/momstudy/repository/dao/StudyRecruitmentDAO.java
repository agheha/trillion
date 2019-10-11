package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.FileVO;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.StudyRecruitment;

public interface StudyRecruitmentDAO {
	// 조회수가 많은 순으로 스터디 가져오기
	List<StudyRecruitment> viewSeeCnt();
	// 최신날짜순으로 스터디 가져오기
	List<StudyRecruitment> viewLatestdate();
	// 멤버가 많은 순으로 스터디 가져오기
	List<StudyRecruitment> viewUserCnt();
	// 
	// 스터디 모집글 리스트 전체 조회
	List<StudyRecruitment> selectStudyRecruitment(Search search);
	
	// 스터디 모집글 상세 조회
	StudyRecruitment selectOneStudyRecruitment(int strNum);
	
	// 스터디 모집글 등록
	void insertStudyRecruitment(StudyRecruitment str);
	
	// 스터디 모집글 수정
	void updateStudyRecruitment(StudyRecruitment str);
	
	// 조회수 증가
	void updateViewCnt(int strNum);
	
	// 스터디 모집글 삭제
	void deleteStudyRecruitment(int strNum);
	
	// 스터디번호로 스터디모집글 가져오기
	StudyRecruitment whetherStudyRecruitment(int studyNum);
	
	// 카테고리 리스트 불러오기
	List<String> categorySelect();
	
	// 해당 게시물의 사진 불러오기
	FileVO selectFile(int studyNum);
} 
