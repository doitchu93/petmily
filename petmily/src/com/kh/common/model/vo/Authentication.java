package com.kh.common.model.vo;

import java.sql.Timestamp;

public class Authentication {
	
	private int authenticationNo; //AUTHENTICATION_NO NUMBER PRIMARY KEY,
    private String email; //EMAIL VARCHAR2(100) NOT NULL,
    private String randomCode; //RANDOM_CODE VARCHAR2(10) NOT NULL,
    private Timestamp enrollDate; //ENROLL_DATE DATE DEFAULT SYSDATE
    
	public Authentication() {
		super();
	}
	public Authentication(String email, String randomCode) {
		super();
		this.email = email;
		this.randomCode = randomCode;
	}
	public Authentication(String randomCode, Timestamp enrollDate) {
		super();
		this.randomCode = randomCode;
		this.enrollDate = enrollDate;
	}
	public Authentication(int authenticationNo, String email, String randomCode, Timestamp enrollDate) {
		super();
		this.authenticationNo = authenticationNo;
		this.email = email;
		this.randomCode = randomCode;
		this.enrollDate = enrollDate;
	}
	
	public int getAuthenticationNo() {
		return authenticationNo;
	}
	public void setAuthenticationNo(int authenticationNo) {
		this.authenticationNo = authenticationNo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRandomCode() {
		return randomCode;
	}
	public void setRandomCode(String randomCode) {
		this.randomCode = randomCode;
	}
	public Timestamp getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Timestamp enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	@Override
	public String toString() {
		return "Authentication [authenticationNo=" + authenticationNo + ", email=" + email + ", randomCode="
				+ randomCode + ", enrollDate=" + enrollDate + "]";
	}
	
}
