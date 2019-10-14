package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Board {
    private int num;
    private int studyNo;
    private int type;
    private int notice;
    private int commentGroupCode;
    private String email;
    private String title;
    private String content;
    private Date regDate;
    private int seeCnt;
    int numbering;
    
    public int getNumbering() {
		return numbering;
	}
	public void setNumbering(int numbering) {
		this.numbering = numbering;
	}
	public int getSeeCnt() {
		return seeCnt;
	}
	public void setSeeCnt(int seeCnt) {
		this.seeCnt = seeCnt;
	}
	int cnt;
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	public int getCommentGroupCode() {
		return commentGroupCode;
	}
	public void setCommentGroupCode(int commentGroupCode) {
		this.commentGroupCode = commentGroupCode;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
    
}

