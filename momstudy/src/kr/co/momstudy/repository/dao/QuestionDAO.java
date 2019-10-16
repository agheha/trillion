package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Question;
import kr.co.momstudy.repository.vo.Search;

public interface QuestionDAO {
	// 내 문의글 보기 
	List<Question> selectQuestion(Search search);
	// 문의글 추가하기
	void questionWrite(Question question);
	// 상세보기 글가져오기
	Question selectOneQuestion(int num);
}
