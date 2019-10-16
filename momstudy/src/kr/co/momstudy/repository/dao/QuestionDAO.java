package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.Question;
import kr.co.momstudy.repository.vo.Search;

public interface QuestionDAO {
	// 내 문의글 보기 
	List<Question> selectQuestion(Search search);
	// 문의글 추가하기
	void questionWrite(Question question);
	// 상세보기 글가져오기
	Question selectOneQuestion(int num);
	// 문의 된 전체글 목록보기admin
	List<Question> selectAdminQuestion(Search search);
	//문의 된 하나의 글 보기 admin
	Question selectAdminOneQuestion(int num);
	//문의 글의 코멘트 그룹 코드를 받아서 그 글에 있는 답변 목록 가져옴admin
	List<Comment>selectAdminQuestioncomment(int num);
	//문의글 하나에 코멘트 쓰기(답변등록)admin
	int insertQcoment(Comment comment);
	int QconditionUpdate(Comment comment);
}
