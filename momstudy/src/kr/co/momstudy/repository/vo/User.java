package kr.co.momstudy.repository.vo;

import java.util.Date;

public class User {
	private String email;
	private String pass;
	private String name;
	private String phoneNum;
	private Date birth;
	private int status;
	private int type;
	private Date banDate;
	private int fileGroupCode;
	private String gender;
	private String certifiedCode;
	private Date partDate;
	private int cnt;
	private int openCnt;
	private int joinCnt;
	
	// 신고 횟수
	private int rpcount;
	// 밴 날짜 설정 할때 추가 일(더블로 설정하면 초단위 까지 가능)
	private int ban;
	
	
	public int getBan() {
		return ban;
	}
	public void setBan(int ban) {
		this.ban = ban;
	}
	public int getRpcount() {
		return rpcount;
	}
	public void setRpcount(int rpcount) {
		this.rpcount = rpcount;
	}
	public int getOpenCnt() {
		return openCnt;
	}
	public void setOpenCnt(int openCnt) {
		this.openCnt = openCnt;
	}
	public int getJoinCnt() {
		return joinCnt;
	}
	public void setJoinCnt(int joinCnt) {
		this.joinCnt = joinCnt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public Date getPartDate() {
		return partDate;
	}
	public void setPartDate(Date partDate) {
		this.partDate = partDate;
	}
	public String getCertifiedCode() {
		return certifiedCode;
	}
	public void setCertifiedCode(String certifiedCode) {
		this.certifiedCode = certifiedCode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public Date getBanDate() {
		return banDate;
	}
	public void setBanDate(Date banDate) {
		this.banDate = banDate;
	}
	public int getFileGroupCode() {
		return fileGroupCode;
	}
	public void setFileGroupCode(int fileGroupCode) {
		this.fileGroupCode = fileGroupCode;
	}
	
	
	
}
