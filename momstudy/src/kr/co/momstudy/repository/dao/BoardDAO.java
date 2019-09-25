package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Board;

public interface BoardDAO {
 
	List<Board> selectBoard();
	Board selectOneBoard(int no);
	void insertBoard(Board board);
}
