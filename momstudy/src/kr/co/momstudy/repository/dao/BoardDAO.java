package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Board;
import kr.co.momstudy.repository.vo.Search;

public interface BoardDAO {
    
	// 전체 리스트
	List<Board> selectBoard(Search search);
	// 게시글 상세조회
	Board selectOneBoard(int num);
	// 게시글 등록
	void insertBoard(Board board);
	void insertBoard2(Board board);
	// 게시글 수
	void updateBoard(Board board);
	// 게시글 조회
	void updateSeeCnt(int num);
	// 게시글 삭제
	int deleteBoard(int num);	
}
