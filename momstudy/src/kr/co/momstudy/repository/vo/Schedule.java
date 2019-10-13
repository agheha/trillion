package kr.co.momstudy.repository.vo;

import java.util.List;

public class Schedule {
	List<Calenders> list;
	String[] dates;
	
	public List<Calenders> getList() {
		return list;
	}
	
	public void setList(List<Calenders> list) {
		this.list = list;
	}

	public String[] getDates() {
		return dates;
	}

	public void setDates(String[] dates) {
		this.dates = dates;
	}

	
}
