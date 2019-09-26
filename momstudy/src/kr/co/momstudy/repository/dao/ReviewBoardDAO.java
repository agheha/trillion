package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.ReviewBoard;

public interface ReviewBoardDAO {
	
	// 후기 게시판 전체 리스트 출력
	List<ReviewBoard> selectReviewBoard();
}
