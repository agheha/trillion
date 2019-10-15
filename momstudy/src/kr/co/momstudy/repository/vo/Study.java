package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Study {
	private String name;
	private Date regDate;
	private String email;
	private int categoryCode;
	private String categoryName;
	private int num;
	// 주소 
	private int addressCode;
	private String addressDetail;
	private String addressDetail2;
	//카운트 받을것(팀원수)
	private int member;
	private int fileGroupCode;

	public int getFileGroupCode() {
		return fileGroupCode;
	}
	public void setFileGroupCode(int fileGroupCode) {
		this.fileGroupCode = fileGroupCode;
	}
	public int getMember() {
		return member;
	}
	public void setMember(int member) {
		this.member = member;
	}
	
	private int cnt;
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getAddressDetail2() {
		return addressDetail2;
	}
	public void setAddressDetail2(String addressDetail2) {
		this.addressDetail2 = addressDetail2;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	
	
}
