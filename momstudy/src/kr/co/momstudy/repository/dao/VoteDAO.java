package kr.co.momstudy.repository.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.momstudy.repository.vo.Vote;
import kr.co.momstudy.repository.vo.VoteAricle;
import kr.co.momstudy.repository.vo.VoteCnt;
import kr.co.momstudy.repository.vo.VoteResult;

public interface VoteDAO {


	 void insertVote(Vote vote);

	 List<Vote> selectVote(int num);

	 Vote selectOneVote(int num);
	
	 void insertVoteAricle(VoteAricle va);
	
	 List<VoteAricle> selectVoteAricle(int num);
	
	 void insertVoteResult(VoteResult vr);

	 List<VoteResult> selectResult(int num);
	
	 int selectCheckResult(VoteCnt vc);
	
	 int selectVoteResultCnt(int num);
	
	 void deleteVoteResultByEmail(VoteCnt vc);
	
	 String selectAricleContent(int code); 
	
	 void deleteVote(int num);
	 
	 void updateVote(HashMap map);
}
