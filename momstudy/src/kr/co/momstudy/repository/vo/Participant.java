package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Participant {
	private int num;
	private int studyNum;
	private String email;
	private Date partDate;
	private int condition;
	private String name;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStudyNum() {
		return studyNum;
	}
	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getPartDate() {
		return partDate;
	}
	public void setPartDate(Date partDate) {
		this.partDate = partDate;
	}
	public int getCondition() {
		return condition;
	}
	public void setCondition(int condition) {
		this.condition = condition;
	}
	
}