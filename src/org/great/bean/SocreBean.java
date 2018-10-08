package org.great.bean;

public class SocreBean {

	private int scId;
	private int sScore;// -- 考试总得分
	private int eId; //   -- 试卷信息ID，哪份考卷的总得分
	private int exId;
	public int getScId() {
		return scId;
	}
	public void setScId(int scId) {
		this.scId = scId;
	}
	public int getsScore() {
		return sScore;
	}
	public void setsScore(int sScore) {
		this.sScore = sScore;
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
}
