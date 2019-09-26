package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Vote;
import kr.co.momstudy.repository.vo.VoteAricle;
import kr.co.momstudy.repository.vo.VoteCnt;
import kr.co.momstudy.repository.vo.VoteResult;

public interface VoteDAO {


	public void insertVote(Vote vote);

	public List<Vote> selectVote(int num);

	public Vote selectOneVote(int num);
	
	public void insertVoteAricle(VoteAricle va);
	
	public List<VoteAricle> selectVoteAricle(int num);
	
	public void insertVoteResult(VoteResult vr);

	public List<VoteResult> selectResult(int num);
	
	public int selectCheckResult(VoteCnt vc);
	
	public int selectVoteResultCnt(int num);
	
	public void deleteVoteResultByEmail(VoteCnt vc);
	
	public String selectAricleContent(int code); 
	
	
}
