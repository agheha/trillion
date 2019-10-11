package kr.co.momstudy.repository.vo;

public class Category {
	private int categoryCode;
	private String categoryName;
	// 카데고리별 스터디 수 받기위함
	private int cnt;
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
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
	
}
