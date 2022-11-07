package com.kh.notice.model.vo;

import java.sql.Date;

public class Notice {
	
//	NOTICE_NO	NUMBER
//	USER_NO	NUMBER
//	NOTICE_TITLE	VARCHAR2(100 BYTE)
//	CREATE_DATE	DATE
//	NOTICE_CONTENT	VARCHAR2(4000 BYTE)
//	STATUS	VARCHAR2(1 BYTE)
	
	private int noticeNo;
	private int userNo;
	private String noticeTitle;
	private Date CreateDate;
	private String noticeContent;
	private String status;
	private int count;
	
	
	
	public Notice() {
		super();
	}
	
	
	
	
	
	public Notice(int noticeNo, String noticeTitle, Date createDate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		CreateDate = createDate;
	}





	public Notice(int noticeNo, String noticeTitle, String noticeContent) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
	}
	
	public Notice(int noticeNo, Date createDate, String noticeTitle, int count) {
		super();
		this.noticeNo = noticeNo;
		CreateDate = createDate;
		this.noticeTitle = noticeTitle;
		this.count = count;
	}

	public Notice(int noticeNo, int userNo, String noticeTitle, Date createDate, String noticeContent, String status) {
		super();
		this.noticeNo = noticeNo;
		this.userNo = userNo;
		this.noticeTitle = noticeTitle;
		CreateDate = createDate;
		this.noticeContent = noticeContent;
		this.status = status;
	}
	
	
	
	public int getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", userNo=" + userNo + ", noticeTitle=" + noticeTitle + ", CreateDate="
				+ CreateDate + ", noticeContent=" + noticeContent + ", status=" + status + ", count=" + count + "]";
	}

}
