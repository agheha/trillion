package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.Study;

public interface ReviewBoardDAO {
	
	// 후기 게시판 전체 리스트 불러옴
	List<ReviewBoard> selectReviewBoard();
	
	// 이메일 주소를 넘겨서 후기등록 가능한 리스트를 불러옴
	List<Study> selectStudy(String email);
	
	
	Study selectStudy2(int sNum);
}
