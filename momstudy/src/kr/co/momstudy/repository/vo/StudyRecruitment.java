package kr.co.momstudy.repository.vo;

import java.util.Date;

public class StudyRecruitment {
	private int num;
	private String title;
	private String content;
	private Date regDate;
	private String email;
	private int condition;
	private int categoryCode;
	private int addressCode;
	private int studyNum;
	private int openCondition;
	private int seeCnt;
	private int fileGroupCode;
	private int commentGroupCode;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	public int getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}
	public int getAddressCode() {
		return addressCode;
	}
	public void setAddressCode(int addressCode) {
		this.addressCode = addressCode;
	}
	public int getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}
	public int getOpenCondition() {
		return openCondition;
	}
	public void setOpenCondition(int openCondition) {
		this.openCondition = openCondition;
	}
	public int getSeeCnt() {
		return seeCnt;
	}
	public void setSeeCnt(int seeCnt) {
		this.seeCnt = seeCnt;
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
