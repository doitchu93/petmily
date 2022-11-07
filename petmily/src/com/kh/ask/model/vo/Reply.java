package com.kh.ask.model.vo;

import java.sql.Date;

public class Reply {

//	REPLY_NO	NUMBER
//	REPLY_CONTENT	VARCHAR2(400 BYTE)
//	REF_REPNO	NUMBER
//	REPLY_WRITER	NUMBER
//	CREATE_DATE	DATE
//	REPLY_STATUS	VARCHAR2(12 BYTE)
	
	private int replyNo;
	private String replyContent;
	private int refRepno;
	private int replyWriter;
	private Date createDate;
	private String replyStatus;
	private String replyTitle;
	
	
	
	public Reply() {
		super();
	}
	
	public Reply(int refRepno, String replyStatus) {
		super();
		this.refRepno = refRepno;
		this.replyStatus = replyStatus;
	}

	public Reply(String replyContent, int refRepno) {
		super();
		this.replyContent = replyContent;
		this.refRepno = refRepno;
	}

	public Reply(int replyNo, String replyContent, int refRepno, int replyWriter, Date createDate, String replyStatus) {
		super();
		this.replyNo = replyNo;
		this.replyContent = replyContent;
		this.refRepno = refRepno;
		this.replyWriter = replyWriter;
		this.createDate = createDate;
		this.replyStatus = replyStatus;
	}
	
	
	
	public int getReplyNo() {
		return replyNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public int getRefRepno() {
		return refRepno;
	}
	public void setRefRepno(int refRepno) {
		this.refRepno = refRepno;
	}
	public int getReplyWriter() {
		return replyWriter;
	}
	public void setReplyWriter(int replyWriter) {
		this.replyWriter = replyWriter;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}
	public String getReplyTitle() {
		return replyTitle;
	}

	public void setReplyTitle(String replyTitle) {
		this.replyTitle = replyTitle;
	}

	@Override
	public String toString() {
		return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", refRepno=" + refRepno
				+ ", replyWriter=" + replyWriter + ", createDate=" + createDate + ", replyStatus=" + replyStatus
				+ ", replyTitle=" + replyTitle + "]";
	}

	
	
}
