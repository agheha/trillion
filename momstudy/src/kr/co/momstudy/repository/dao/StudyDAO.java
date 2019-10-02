package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.Study;

public interface StudyDAO {
	
	
	// 스터디 생성
	void insertStudy(Study study);
	//스터디 장을 넣음
	void insertParticipant(Participant pt);
	
	List<Study> selectStudy(String email);
	
	Study selectOneStudy(int studyNum);
}
