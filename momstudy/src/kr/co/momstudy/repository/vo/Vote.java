package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Vote {
	int studyNo;
	int num;
	String title;
	int duplication;
	int anonumous;
	int ariclePlus;
	Date regDate;
	Date limitDate;
	
	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
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
	public int getDuplication() {
		return duplication;
	}
	public void setDuplication(int duplication) {
		this.duplication = duplication;
	}
	public int getAnonumous() {
		return anonumous;
	}
	public void setAnonumous(int anonumous) {
		this.anonumous = anonumous;
	}
	public int getAriclePlus() {
		return ariclePlus;
	}
	public void setAriclePlus(int ariclePlus) {
		this.ariclePlus = ariclePlus;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getLimitDate() {
		return limitDate;
	}
	public void setLimitDate(Date limitDate) {
		this.limitDate = limitDate;
	}
	
	
}
