package com.kh.board.model.vo;

import java.sql.Date;

public class Board {
	
	private int comNo; //COM_NO	NUMBER
	private int userNo; //USER_NO	NUMBER
	private int likeCount; //LIKE_COUNT	NUMBER
	private int count; // COUNT	NUMBER
	private Date createDate; // CREATE_DATE	DATE
	private String comTitle; //COM_TITLE	VARCHAR2(100 BYTE)
	private String comSummary; //COM_SUMMARY	VARCHAR2(1000 BYTE)
	private String comContent; //COM_CONTENT	VARCHAR2(4000 BYTE)
	private int comType; // COM_TYPE	NUMBER
	private String status; //STATUS	VARCHAR2(1 BYTE)
	public Board() {
		super();
	}
	
	
	
	public Board(int comNo, int userNo, int count, Date createDate, String comTitle) {
		super();
		this.comNo = comNo;
		this.userNo = userNo;
		this.count = count;
		this.createDate = createDate;
		this.comTitle = comTitle;
	}



	public Board(int comNo, int userNo, int likeCount, int count, Date createDate, String comTitle, String comSummary,
			String comContent, int comType, String status) {
		super();
		this.comNo = comNo;
		this.userNo = userNo;
		this.likeCount = likeCount;
		this.count = count;
		this.createDate = createDate;
		this.comTitle = comTitle;
		this.comSummary = comSummary;
		this.comContent = comContent;
		this.comType = comType;
		this.status = status;
	}
	public int getComNo() {
		return comNo;
	}
	public void setComNo(int comNo) {
		this.comNo = comNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getComTitle() {
		return comTitle;
	}
	public void setComTitle(String comTitle) {
		this.comTitle = comTitle;
	}
	public String getComSummary() {
		return comSummary;
	}
	public void setComSummary(String comSummary) {
		this.comSummary = comSummary;
	}
	public String getComContent() {
		return comContent;
	}
	public void setComContent(String comContent) {
		this.comContent = comContent;
	}
	public int getComType() {
		return comType;
	}
	public void setComType(int comType) {
		this.comType = comType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Board [comNo=" + comNo + ", userNo=" + userNo + ", likeCount=" + likeCount + ", count=" + count
				+ ", createDate=" + createDate + ", comTitle=" + comTitle + ", comSummary=" + comSummary
				+ ", comContent=" + comContent + ", comType=" + comType + ", status=" + status + "]";
	}

	
	
	
	
}
