package kr.co.momstudy.repository.vo;

public class AdminCategory {

	private int categoryCode;
	private String categoryName;
	private int studycnt;
	
	
	public int getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getStudycnt() {
		return studycnt;
	}
	public void setStudycnt(int studycnt) {
		this.studycnt = studycnt;
	}

}
