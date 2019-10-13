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
	String email;
	int cnt;
	int numbering;
	
	public int getNumbering() {
		return numbering;
	}
	public void setNumbering(int numbering) {
		this.numbering = numbering;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	int type;
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
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
