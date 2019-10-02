package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;

public interface ReviewBoardDAO {
	
	// 후기 게시판 전체 리스트 불러옴
	List<ReviewBoard> selectReviewBoard(Search search);
	
	// 이메일 주소를 넘겨서 후기등록 가능한 리스트를 불러옴
	List<Study> selectStudy(String email);
	Study selectStudy2(int sNum);
	
	// 후기게시판 등록하기
	void insertReviewBoard(ReviewBoard reviewBoard);
	// 조회수 카운트 올리기
	void updateViewCnt(int no);
}
