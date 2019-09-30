package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Participant {
	private int num;
	private String email;
	private Date partDate;
	private int condition;
	
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
