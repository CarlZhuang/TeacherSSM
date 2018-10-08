package org.great.bean;

public class MenuBean {

	private int mId;
	private String mTitle;
	private String mUrl;
	private int mParent;
	private String mIcon;
	public int getmId() {
		return mId;
	}
	public void setmId(int mId) {
		this.mId = mId;
	}
	public String getmTitle() {		return mTitle;
	}
	public void setmTitle(String mTitle) {
		this.mTitle = mTitle;
	}
	public String getmUrl() {
		return mUrl;
	}
	public void setmUrl(String mUrl) {
		this.mUrl = mUrl;
	}
	public int getmParent() {
		return mParent;
	}
	public void setmParent(int mParent) {
		this.mParent = mParent;
	}
	public String getmIcon() {
		return mIcon;
	}
	public void setmIcon(String mIcon) {
		this.mIcon = mIcon;
	}
	@Override
	public String toString() {
		return "MenuBean [mId=" + mId + ", mTitle=" + mTitle + ", mUrl=" + mUrl
				+ ", mParent=" + mParent + ", mIcon=" + mIcon + "]";
	}
	
}
