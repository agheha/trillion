package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Calendar {
	private int num;
	private int studyNo;
	private String content;
	private Date startDate;
	private Date endDate;
	private int type;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	
}
