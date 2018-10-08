package org.great.bean;

public class JoinBean {

	private int jId;
	private int eId;//   -- 试卷信息ID,考生参加哪场考试
	private int exId;//   -- 考生ID
	private int jState;
	public int getjId() {
		return jId;
	}
	public void setjId(int jId) {
		this.jId = jId;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public int getExId() {
		return exId;
	}
	public void setExId(int exId) {
		this.exId = exId;
	}
	public int getjState() {
		return jState;
	}
	public void setjState(int jState) {
		this.jState = jState;
	}
}
