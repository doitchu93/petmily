package com.kh.groups.model.vo;

import java.sql.Date;

public class Groups {
//	GROUP_NO	NUMBER
//	GROUP_NAME	VARCHAR2(20 BYTE)
//	GROUP_ENROLL_NO	VARCHAR2(20 BYTE)
//	GROUP_URL	VARCHAR2(20 BYTE)
//	GROUP_ETC	VARCHAR2(20 BYTE)
//	GROUP_AUTH	VARCHAR2(1 BYTE)
//	USER_NO	NUMBER
	
	private int groupNo;
	private String groupName;
	private String groupEnrollno;
	private String groupUrl;
	private String groupEtc;
	private String groupAuth;
	private int userNo;
	private String userPhone;
	private String userName;
	private Date createDate;
	
	
	public Groups() {
		super();
	}
	
	public Groups(int groupNo, Date createDate, String userName, String groupName, String groupAuth) {
		super();
		this.groupNo = groupNo;
		this.createDate = createDate;
		this.groupName = groupName;
		this.userName = userName;
		this.groupAuth = groupAuth;
	}

	public Groups(String groupName, String userName, String userPhone, String groupEnrollno, 
			String groupUrl, String groupEtc) {
		super();
		this.groupName = groupName;
		this.groupEnrollno = groupEnrollno;
		this.groupUrl = groupUrl;
		this.groupEtc = groupEtc;
		this.userPhone = userPhone;
		this.userName = userName;
	}

	public Groups(int groupNo, String groupName, String userName, int userNo, String userPhone, String groupEnrollno, 
			String groupUrl, String groupEtc, String groupAuth) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.userName = userName;
		this.userNo = userNo;
		this.userPhone = userPhone;
		this.groupEnrollno = groupEnrollno;
		this.groupUrl = groupUrl;
		this.groupEtc = groupEtc;
		this.groupAuth = groupAuth;
	}

	public Groups(int groupNo, String groupName, String groupEnrollno, String groupUrl, String groupEtc,
			String groupAuth, int userNo, String userPhone) {
		super();
		this.groupNo = groupNo;
		this.groupName = groupName;
		this.groupEnrollno = groupEnrollno;
		this.groupUrl = groupUrl;
		this.groupEtc = groupEtc;
		this.groupAuth = groupAuth;
		this.userNo = userNo;
		this.userPhone = userPhone;
	}




	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public String getGroupEnrollno() {
		return groupEnrollno;
	}
	public void setGroupEnrollno(String groupEnrollno) {
		this.groupEnrollno = groupEnrollno;
	}
	public String getGroupUrl() {
		return groupUrl;
	}
	public void setGroupUrl(String groupUrl) {
		this.groupUrl = groupUrl;
	}
	public String getGroupEtc() {
		return groupEtc;
	}
	public void setGroupEtc(String groupEtc) {
		this.groupEtc = groupEtc;
	}
	public String getGroupAuth() {
		return groupAuth;
	}
	public void setGroupAuth(String groupAuth) {
		this.groupAuth = groupAuth;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "Groups [groupNo=" + groupNo + ", groupName=" + groupName + ", groupEnrollno=" + groupEnrollno
				+ ", groupUrl=" + groupUrl + ", groupEtc=" + groupEtc + ", groupAuth=" + groupAuth + ", userNo="
				+ userNo + ", userPhone=" + userPhone + ", userName=" + userName + ", createDate=" + createDate + "]";
	}

	

	

	
}
