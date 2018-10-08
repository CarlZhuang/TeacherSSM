package org.great.bean;

public class ExamInfoBean {

	private int eId;
	private String eNo;//-- 试卷编号
	private String eName;// -- 考试名称
	private String eType; // -- 考试类型
	private String eTime ;// -- 考试时间
	private String eWork ;// -- 鉴定工种
	private String eIdent;//-- 鉴定机构
	private String eLevel;//-- 鉴定等级
	private int ePass ;//   -- 及格分数
	public int geteId() {
		return eId;
	}
	public void seteId(int eId) {
		this.eId = eId;
	}
	public String geteNo() {
		return eNo;
	}
	public void seteNo(String eNo) {
		this.eNo = eNo;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String geteType() {
		return eType;
	}
	public void seteType(String eType) {
		this.eType = eType;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public String geteWork() {
		return eWork;
	}
	public void seteWork(String eWork) {
		this.eWork = eWork;
	}
	public String geteIdent() {
		return eIdent;
	}
	public void seteIdent(String eIdent) {
		this.eIdent = eIdent;
	}
	public String geteLevel() {
		return eLevel;
	}
	public void seteLevel(String eLevel) {
		this.eLevel = eLevel;
	}
	public int getePass() {
		return ePass;
	}
	public void setePass(int ePass) {
		this.ePass = ePass;
	}
}
