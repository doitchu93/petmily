package com.kh.ask.model.vo;

import java.sql.Date;

public class Ask {
	
//	ASK_NO	NUMBER
//	ASK_TITLE	VARCHAR2(20 BYTE)
//	ASK_WRITER	VARCHAR2(20 BYTE)
//	ASK_CONTENT	VARCHAR2(1000 BYTE)
//	ASK_REPLY	VARCHAR2(1000 BYTE)
//	CREATE_DATE	DATE
//	REPLY_DATE	DATE
//	USER_NO	NUMBER
	
	private int askNo; //문의글번호
	private String askTitle; //문의글제목
	private String askWriter; //작성자
	private String askContent; //문의글본문
	private String askReply; //문의글답변
	private Date createDate; //작성일
	private Date replyDate; //답변작성일
	private int userNo; //회원번호
	
	private String askCategory;
	private String replyStatus;
	
	private int categoryNo;
	
	public Ask() {
		super();
	}
	
	public Ask(String askTitle, String askWriter, String askContent) {
		super();
		this.askTitle = askTitle;
		this.askWriter = askWriter;
		this.askContent = askContent;
	}
	public Ask(int askNo, String askCategory, String askTitle, String askWriter, Date createDate) {
		super();
		this.askNo = askNo;
		this.askTitle = askTitle;
		this.askWriter = askWriter;
		this.createDate = createDate;
		this.askCategory = askCategory;
	}
	

	public Ask(int askNo, String askCategory, String askTitle, String askWriter, Date createDate, String askReply) {
		super();
		this.askNo = askNo;
		this.askTitle = askTitle;
		this.askWriter = askWriter;
		this.createDate = createDate;
		this.askCategory = askCategory;
		this.askReply = askReply;
	}

	public Ask(int askNo, String askCategory, String askTitle, Date createDate, String replyStatus, String askWriter) {
		super();
		this.askNo = askNo;
		this.askTitle = askTitle;
		this.askWriter = askWriter;
		this.createDate = createDate;
		this.askCategory = askCategory;
		this.replyStatus = replyStatus;
	}

	public Ask(int askNo, String askCategory, String askTitle, Date createDate, String replyStatus, int userNo) {
		super();
		this.askNo = askNo;
		this.askTitle = askTitle;
		this.createDate = createDate;
		this.userNo = userNo;
		this.askCategory = askCategory;
		this.replyStatus = replyStatus;
	}

	public Ask(int askNo, String askCategory, String askTitle, String askWriter, String askContent) {
		super();
		this.askNo = askNo;
		this.askCategory = askCategory;
		this.askTitle = askTitle;
		this.askWriter = askWriter;
		this.askContent = askContent;
	}

	public Ask(int askNo, String askCategory, String askTitle, Date createDate, String replyStatus) {
		super();
		this.askNo = askNo;
		this.askCategory = askCategory;
		this.askTitle = askTitle;
		this.createDate = createDate;
		this.replyStatus = replyStatus;
	}

	public Ask(int askNo, String askTitle, String askWriter, String askContent, String askReply, Date createDate,
			Date replyDate, int userNo, String askCategory, String replyStatus) {
		super();
		this.askNo = askNo;
		this.askTitle = askTitle;
		this.askWriter = askWriter;
		this.askContent = askContent;
		this.askReply = askReply;
		this.createDate = createDate;
		this.replyDate = replyDate;
		this.userNo = userNo;
		this.askCategory = askCategory;
		this.replyStatus = replyStatus;
	}

	public int getAskNo() {
		return askNo;
	}
	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}
	public String getAskTitle() {
		return askTitle;
	}
	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}
	public String getAskWriter() {
		return askWriter;
	}
	public void setAskWriter(String askWriter) {
		this.askWriter = askWriter;
	}
	public String getAskContent() {
		return askContent;
	}
	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}
	public String getAskReply() {
		return askReply;
	}
	public void setAskReply(String askReply) {
		this.askReply = askReply;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAskCategory() {
		return askCategory;
	}

	public void setAskCategory(String askCategory) {
		this.askCategory = askCategory;
	}

	public String getReplyStatus() {
		return replyStatus;
	}

	public void setReplyStatus(String replyStatus) {
		this.replyStatus = replyStatus;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	@Override
	public String toString() {
		return "Ask [askCategory=" + askCategory + ", askContent=" + askContent + ", askNo=" + askNo + ", askReply="
				+ askReply + ", askTitle=" + askTitle + ", askWriter=" + askWriter + ", categoryNo=" + categoryNo
				+ ", createDate=" + createDate + ", replyDate=" + replyDate + ", replyStatus=" + replyStatus
				+ ", userNo=" + userNo + "]";
	}

	
}
