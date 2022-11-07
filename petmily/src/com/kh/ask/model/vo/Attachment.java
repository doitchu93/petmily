package com.kh.ask.model.vo;

import java.sql.Date;

public class Attachment {

//	FILE_NO	NUMBER
//	REF_NO	NUMBER
//	ORIGIN_NAME	VARCHAR2(255 BYTE)
//	CHANGE_NAME	VARCHAR2(255 BYTE)
//	FILE_PATH	VARCHAR2(1000 BYTE)
//	UPLOAD_DATE	DATE
//	FILE_LEVEL	NUMBER
//	STATUS	VARCHAR2(1 BYTE)
//	TYPE	VARCHAR2(2 BYTE)
	
	private int fileNo;
	private int refNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private String status;
	private String type;
	private int refNoNotice;
	
	
	
	public Attachment() {
		super();
	}
	
	public Attachment(int fileNo, String originName, String changeName, String filePath) {
		super();
		this.fileNo = fileNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
	}

	public Attachment(int fileNo, int refNo, String originName, String changeName, String filePath, Date uploadDate,
			String status, String type) {
		super();
		this.fileNo = fileNo;
		this.refNo = refNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.status = status;
		this.type = type;
	}
	
	
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getRefNo() {
		return refNo;
	}
	public void setRefNo(int refNo) {
		this.refNo = refNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getRefNoNotice() {
		return refNoNotice;
	}

	public void setRefNoNotice(int refNoNotice) {
		this.refNoNotice = refNoNotice;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", refNo=" + refNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", status=" + status
				+ ", type=" + type + ", refNoNotice=" + refNoNotice + "]";
	}

}
