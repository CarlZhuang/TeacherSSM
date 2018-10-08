package org.great.bean;

public class ExamineeBean {

	private int exId;
	private String exName;
	private String exIdCard;
	private String exExamCard;
	
	public int getExId() {
		return exId;
	}
	public void setExId(int exId) {
		this.exId = exId;
	}
	public String getExName() {
		return exName;
	}
	public void setExName(String exName) {
		this.exName = exName;
	}
	public String getExIdCard() {
		return exIdCard;
	}
	public void setExIdCard(String exIdCard) {
		this.exIdCard = exIdCard;
	}
	public String getExExamCard() {
		return exExamCard;
	}
	public void setExExamCard(String exExamCard) {
		this.exExamCard = exExamCard;
	}
	@Override
	public String toString() {
		return "ExamineeBean [exId=" + exId + ", exName=" + exName
				+ ", exIdCard=" + exIdCard + ", exExamCard=" + exExamCard + "]";
	}
}
