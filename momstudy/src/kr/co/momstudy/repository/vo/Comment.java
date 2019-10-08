package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Comment {
	private String email;
	private String content;
	private int num;
	private int commentGroupCode;
	private int parent;
	private int commentGroup;
	private Date regDate;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCommentGroupCode() {
		return commentGroupCode;
	}
	public void setCommentGroupCode(int commentGroupCode) {
		this.commentGroupCode = commentGroupCode;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getCommentGroup() {
		return commentGroup;
	}
	public void setCommentGroup(int commentGroup) {
		this.commentGroup = commentGroup;
	}
	

}
