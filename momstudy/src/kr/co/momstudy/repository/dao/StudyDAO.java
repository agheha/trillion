package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Calenders;
import kr.co.momstudy.repository.vo.Participant;
import kr.co.momstudy.repository.vo.Score;
import kr.co.momstudy.repository.vo.Study;

public interface StudyDAO {
	
	
	// 스터디 생성
	void insertStudy(Study study);
	//스터디 장을 넣음
	void insertParticipant(Participant pt);
	
	List<Study> selectStudy(String email);
	
	Study selectOneStudy(int studyNum);
	
	void deleteParticipant(Participant pt);
	
	void aprovalParticipant(Participant pt);

	List<Score>selectScore(String email);
	
	void insertScore(Score score);
	
	int checkScore(Score score);
	
	void insertCalender(Calenders c);
	
	List<Calenders> selectCalender(Calenders calender);
	
	Calenders selectOneCalender(int num);
	
	void deleteCalender(int num);
	
	// 스터디에 신청한 적이 있나 확인
	int CheckParticipation(Participant part);
	
	void updateCalender(Calenders calender);
	
	Study selectStudyInfo(int num);
	
	void updateStudyLeader(Study study);
	
	void updateStudy(Study study);
	
	//y
	int deleteStudy(int num);
	//y
}
