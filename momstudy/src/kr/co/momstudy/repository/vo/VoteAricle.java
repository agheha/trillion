package kr.co.momstudy.repository.vo;

import java.util.List;

public class VoteAricle {
	private int num;
	private int code;
	private String content;
	private List<VoteResult> list;

	public List<VoteResult> getList() {
		return list;
	}
	public void setList(List<VoteResult> list) {
		this.list = list;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
}
