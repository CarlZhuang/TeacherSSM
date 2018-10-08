package org.great.bean;

public class QuestionBean {

	private int qId;
	private String qType;// -- 问题类型，是单选，还是多选
	private int qNo;//  - 考题编号
	private String qStem;//  -- 考题题干
	private String qA;//   -- 考题选项
	private String qB;//   -- 考题选项
	private String qC ;//   -- 考题选项
	private String qD;//    -- 考题选项
	private int qScore;//   -- 答对考题得分分数
	private String qAnswer ;// -- 考题答案
	private int sId;
	public int getqId() {
		return qId;
	}
	public void setqId(int qId) {
		this.qId = qId;
	}
	public String getqType() {
		return qType;
	}
	public void setqType(String qType) {
		this.qType = qType;
	}
	public int getqNo() {
		return qNo;
	}
	public void setqNo(int qNo) {
		this.qNo = qNo;
	}
	public String getqStem() {
		return qStem;
	}
	public void setqStem(String qStem) {
		this.qStem = qStem;
	}
	public String getqA() {
		return qA;
	}
	public void setqA(String qA) {
		this.qA = qA;
	}
	public String getqB() {
		return qB;
	}
	public void setqB(String qB) {
		this.qB = qB;
	}
	public String getqC() {
		return qC;
	}
	public void setqC(String qC) {
		this.qC = qC;
	}
	public String getqD() {
		return qD;
	}
	public void setqD(String qD) {
		this.qD = qD;
	}
	public int getqScore() {
		return qScore;
	}
	public void setqScore(int qScore) {
		this.qScore = qScore;
	}
	public String getqAnswer() {
		return qAnswer;
	}
	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}
	public int getsId() {
		return sId;
	}
	public void setsId(int sId) {
		this.sId = sId;
	}
}
