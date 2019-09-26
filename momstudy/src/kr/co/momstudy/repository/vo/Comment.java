package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Comment {
	private String email;
	private String content;
	private int num;
	private int comment_group_code;
	private int parent;
	private Date reg_Date;
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
	public int getComment_group_code() {
		return comment_group_code;
	}
	public void setComment_group_code(int comment_group_code) {
		this.comment_group_code = comment_group_code;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public Date getReg_Date() {
		return reg_Date;
	}
	public void setReg_Date(Date reg_Date) {
		this.reg_Date = reg_Date;
	}
	
}
