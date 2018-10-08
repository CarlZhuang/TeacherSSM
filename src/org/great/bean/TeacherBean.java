package org.great.bean;

public class TeacherBean {

	private int teId;
	private String teAcount;
	private String teName;
	private String teSex;
	private String tePhone;
	private String tePwd;
	
	public int getTeId() {
		return teId;
	}
	public void setTeId(int teId) {
		this.teId = teId;
	}
	public String getTeAcount() {
		return teAcount;
	}
	public void setTeAcount(String teAcount) {
		this.teAcount = teAcount;
	}
	public String getTeName() {
		return teName;
	}
	public void setTeName(String teName) {
		this.teName = teName;
	}
	public String getTeSex() {
		return teSex;
	}
	public void setTeSex(String teSex) {
		this.teSex = teSex;
	}
	public String getTePhone() {
		return tePhone;
	}
	public void setTePhone(String tePhone) {
		this.tePhone = tePhone;
	}
	public String getTePwd() {
		return tePwd;
	}
	public void setTePwd(String tePwd) {
		this.tePwd = tePwd;
	}
	@Override
	public String toString() {
		return "TeacherBean [teId=" + teId + ", teAcount=" + teAcount
				+ ", teName=" + teName + ", teSex=" + teSex + ", tePhone="
				+ tePhone + ", tePwd=" + tePwd + "]";
	}
}
