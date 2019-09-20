package kr.co.momstudy.repository.vo;

public class FileVO {
	private int no;
	private String path;
	private String orgName;
	private String SystemName;
	private int groupCode;
	
	public int getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(int groupCode) {
		this.groupCode = groupCode;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getSystemName() {
		return SystemName;
	}
	public void setSystemName(String systemName) {
		SystemName = systemName;
	}
	
}
