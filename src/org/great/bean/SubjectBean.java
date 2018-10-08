package org.great.bean;

public class SubjectBean {

	private int sId;
	private String sName;//-- 试卷题干
	private String sType;//-- 题干类型，单选还是多选？单选下面放的是单选的考题
	private int eId;
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
	public String getsName() {
		return sName;
	}
	public void setsName(String sName) {
		this.sName = sName;
	}
	public String getsType() {
		return sType;
	}
	public void setsType(String sType) {
		this.sType = sType;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	@Override
	public String toString() {
		return "SubjectBean [sId=" + sId + ", sName=" + sName + ", sType="
				+ sType + ", eId=" + eId + "]";
	}
	
}
