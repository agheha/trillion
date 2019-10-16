package kr.co.momstudy.repository.vo;

import java.util.Date;

public class Report {

	private Integer num;
	private String type;
	private String reportTarget; // 신고당한사람
	private String content;
	private String email; // 신고자
	private Date regDate;
	// 글
	private Integer boardNum;
	private String boardType = ""; // 게시판 종류
	private String boardTitle; // 게시판 제목

	// 신고사유
	private Integer code; // 신고사유 번호
	private String reseaon; // 신고사유 내용
	// 스터디
	private Integer studyNum;
	private String categoryName; // 스터디 분야
	private String categoryCode; // 스터디 분야
	

	private String studyTitle; // 스터디 명
	// 스터디 방장 이메일
	private String cap;
	//	각 별 신고수 가져온 결과를 받기위함
	private Integer rpcnt;
	// 총 개시물 갯수(페이징 처리하는데 필요)
	private Integer cnt;
	
	public String getCategoryCode() {
		return categoryCode;
	}
	
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
	public Integer getCnt() {
		return cnt;
	}

	public void setCnt(Integer cnt) {
		this.cnt = cnt;
	}

	public String getCap() {
		return cap;
	}

	public void setCap(String cap) {
		this.cap = cap;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getStudyTitle() {
		return studyTitle;
	}

	public void setStudyTitle(String studyTitle) {
		this.studyTitle = studyTitle;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public Integer getStudyNum() {
		return studyNum;
	}

	public void setStudyNum(Integer studyNum) {
		this.studyNum = studyNum;
	}

	public String getReseaon() {
		return reseaon;
	}

	public void setReseaon(String reseaon) {
		this.reseaon = reseaon;
	}

	public Integer getRpcnt() {
		return rpcnt;
	}

	public void setRpcnt(Integer rpcnt) {
		this.rpcnt = rpcnt;
	}

	public Integer getNum() {
		return num;
	}

	public void setNum(Integer num) {
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

	public Integer getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(Integer boardNum) {
		this.boardNum = boardNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
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
