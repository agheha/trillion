package kr.co.momstudy.repository.dao;

import java.util.List;

import kr.co.momstudy.repository.vo.Vote;
import kr.co.momstudy.repository.vo.VoteAricle;
import kr.co.momstudy.repository.vo.VoteResult;

public interface VoteDAO {


	public void insertVote(Vote vote);

	public List<Vote> selectVote(int num);

	public Vote selectOneVote(int num);
	
	public void insertVoteAricle(VoteAricle va);
	
	public void insertVoteResult(VoteResult vr);

	public VoteResult selectOneResult(VoteResult vr);
	
	public int selectCheckResult(VoteResult vr);
	
	
	
}
