package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Comment;

public interface CommentDAO {
	List<Comment> selectComment(int no);
	
	void insertCommentReply(Comment comment);
	
	void insertComment(Comment comment);
	
	void deleteComment(int num);
	
	void updateComment(Comment comment);

}
