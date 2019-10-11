package kr.co.momstudy.repository.vo;

import java.util.Date;

public class ReviewBoard {
	private int num;
	private String title;
	private String content;
	private Date regDate;
	private int studyNum;
	private int seeCnt;
	private int score;
	private String email;
	private int fileGroupCode;
	private int commentGroupCode;
	int cnt;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}
	public int getSeeCnt() {
		return seeCnt;
	}
	public void setSeeCnt(int seeCnt) {
		this.seeCnt = seeCnt;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getFileGroupCode() {
		return fileGroupCode;
	}
	public void setFileGroupCode(int fileGroupCode) {
		this.fileGroupCode = fileGroupCode;
	}
	public int getCommentGroupCode() {
		return commentGroupCode;
	}
	public void setCommentGroupCode(int commentGroupCode) {
		this.commentGroupCode = commentGroupCode;
	}
	
	
}
