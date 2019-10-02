package kr.co.momstudy.repository.vo;

public class Address {
	private int addressCode;
	private String addressDetail;
	private String addressDetail2;
	

	public String getAddressDetail() {
		return addressDetail;
	}
	public int getAddressCode() {
		return addressCode;
	}
	public void setAddressCode(int addressCode) {
		this.addressCode = addressCode;
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
}
