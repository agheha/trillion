package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;

public interface ReviewBoardDAO {
	
	// 후기 게시판 전체 리스트 불러옴
<<<<<<< HEAD
	List<ReviewBoard> selectReviewBoard();
	// 카테고리 리스트를 불러옴
	List selectCategory();
=======
	List<ReviewBoard> selectReviewBoard(Search search);
>>>>>>> a2ffbf7bfa2605682dee428c7fde7161251dd565
	
	// 이메일 주소를 넘겨서 후기등록 가능한 리스트를 불러옴
	List<Study> selectStudy(String email);
	
	// 이메일 주소를 넘겨서 대상의 이름을 불러옴
	String selectName(String email);
	
	Study selectStudy2(int sNum);
	
	// 후기게시판 등록하기
	void insertReviewBoard(ReviewBoard reviewBoard);
	// 해당게시판 내용을 불러옴(글번호로 email, 스터디번호를 받아야됨)
	ReviewBoard selectOneReviewBoard(int num);
	// 조회수 카운트 올리기
	void updateViewCnt(int no);
}
