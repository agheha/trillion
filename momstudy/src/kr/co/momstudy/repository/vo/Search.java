package kr.co.momstudy.repository.vo;

public class Search extends Page{
	
	
	public Search() {
		super();
	}
	
	public Search(int pageNo) {
		super(pageNo);
	}
	
	public Search(int pageNo, int listSize) {
		super(pageNo, listSize);
	}


	private String type;
	private String keyword;
	private int category;
	private int studyNum;
	private String filter;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getStudyNum() {
		return studyNum;
	}

	public void setStudyNum(int studyNum) {
		this.studyNum = studyNum;
	}

	public String getFilter() {
		return filter;
	}
	public void setFilter(String filter) {
		this.filter = filter;
	}
}
