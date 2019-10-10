package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Report {
	
	private int num;
	private String type;
	private String reportTarget;
	private int boardNum;
	private String content;
	private int code;
	private String email;
	private Date regDate;
	private String boardType;
	private int studyNum;
	
//  신고사유 받은것	
	private String reseaon;
	public String getReseaon() {
		return reseaon;
	}
	public void setReseaon(String reseaon) {
		this.reseaon = reseaon;
	}

//	각 별 신고수 가져온 결과를 받기위함
	private int cnt;

	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getReportTarget() {
		return reportTarget;
	}
	public void setReportTarget(String reportTarget) {
		this.reportTarget = reportTarget;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
