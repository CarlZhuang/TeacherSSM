package org.great.bean;

public class TimeBean {

	private int tId ;
	private int tAll;//- 考试总时长，建议用秒算
	private int tCurrent;//-- 当前考试时间，建议用秒算
	private int tState; //-- 监考状态
	private int eId;
	public int gettId() {
		return tId;
	}
	public void settId(int tId) {
		this.tId = tId;
	}
	public int gettAll() {
		return tAll;
	}
	public void settAll(int tAll) {
		this.tAll = tAll;
	}
	public int gettCurrent() {
		return tCurrent;
	}
	public void settCurrent(int tCurrent) {
		this.tCurrent = tCurrent;
	}
	public int gettState() {
		return tState;
	}
	public void settState(int tState) {
		this.tState = tState;
	}
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
}
