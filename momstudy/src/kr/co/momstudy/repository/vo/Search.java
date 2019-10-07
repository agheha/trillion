package kr.co.momstudy.repository.vo;

import java.util.ArrayList;
import java.util.List;

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
	private int categoryCode;
	private int studyNum;
	private String filter;
	private List<String[]> types;
	private List<String[]> filters;
	
	public List<String[]> getTypes() {
		return types;
	}

	public List<String[]> getFilters() {
		return filters;
	}

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
	public int getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
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
	
	public void setFilters(String ...strings) {
		List<String[]> list = new ArrayList<>();
		for(String filter : strings) {			
			switch (filter) {
			case "일자":
				list.add(new String [] {"regDate",filter});
				break;
			case "조회수":
				list.add(new String [] {"seeCnt",filter});
				break;
			case "별점":
				list.add(new String [] {"score",filter});
				break;
			case "신청일":
				list.add(new String [] {"partDate",filter});
				break;
			}
		}
		
		this.filters = list;
	}
	
	public void setTypes(String ...strings) {
		List<String[]> list = new ArrayList<>();
		for(String type : strings) {			
			switch (type) {
			case "제목":
				list.add(new String [] {"title",type});
				break;
			case "내용":
				list.add(new String [] {"content",type});
				break;
			case "글쓴이": case "이메일":
				list.add(new String [] {"email",type});
				break;
			case "스터디이름":
				list.add(new String [] {"name",type});
				break;
			}
		}
		
		this.types = list;

	}

}
