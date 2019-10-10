package kr.co.momstudy.repository.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.momstudy.repository.vo.Comment;
import kr.co.momstudy.repository.vo.FileVO;
import kr.co.momstudy.repository.vo.ReviewBoard;
import kr.co.momstudy.repository.vo.Search;
import kr.co.momstudy.repository.vo.Study;

public interface ReviewBoardDAO {
	
	// 후기 게시판 전체 리스트 불러옴
	List<ReviewBoard> selectReviewBoard(Search search);
	
	// 이메일 주소를 넘겨서 후기등록 가능한 리스트를 불러옴
	List<Study> selectStudy(String email);
	Study selectStudy2(int sNum);
	
	// 스터디번호를 넘겨서 게시판을 불러옴
	ReviewBoard selectOneBoard(int num);
	
	// 글번호를 넘겨서 게시판을 불러옴
	ReviewBoard selectOneBoard2(int num);
	
	// 후기게시판 등록하기
	void insertReviewBoard(ReviewBoard reviewBoard);
	// 조회수 카운트 올리기
	void updateViewCnt(int no);
	
	// 후기게시판 삭제하기
	void deleteReviewBoard(int num);
	
	void updateReviewBoard(ReviewBoard reviewBoard);
	
	// 카테고리 리스트 불러오기
	List<String> categorySelect();
	
	// 해당 게시물의 사진 불러오기
	FileVO selectFile(int studyNum);
	
	// 댓글 게시물 등록
	void insertComment(Comment comment);
	
	// 댓글 리스트를 뿌려줌
	List<Comment> selectComment(int commentGroupCode);
	
	// 댓글 삭제
	void deleteComment(@Param("num") int num, @Param("commentGroupCode") int commentGroupCode);
	
	int selectOneBoard3(int commentGroupCode);
}
