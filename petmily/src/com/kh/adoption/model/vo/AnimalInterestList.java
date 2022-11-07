package com.kh.adoption.model.vo;

import java.sql.Date;

public class AnimalInterestList {

	private int wNo; //	W_NO 관심목록번호: SEQ_WNO
	private String type;//	TYPE 구분 : 동물 - 'A'
	private Date enrollDate; //	ENROLL_DATE	등록일 : SYSDATE
	private int userNo;//	USER_NO 회원번호
	private int animalNo; //	ANIMAL_NO 동물번호
	

	public AnimalInterestList(int userNo) {
		super();
		this.userNo = userNo;
	}

	public AnimalInterestList(int wNo, String type, Date enrollDate, int userNo, int animalNo) {
		super();
		this.wNo = wNo;
		this.type = type;
		this.enrollDate = enrollDate;
		this.userNo = userNo;
		this.animalNo = animalNo;
	}
	
	public AnimalInterestList(int userNo, int animalNo) {
		super();
		this.userNo = userNo;
		this.animalNo = animalNo;
	}

	public int getwNo() {
		return wNo;
	}
	public void setwNo(int wNo) {
		this.wNo = wNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getAnimalNo() {
		return animalNo;
	}
	public void setAnimalNo(int animalNo) {
		this.animalNo = animalNo;
	}
	@Override
	public String toString() {
		return "InterestList [wNo=" + wNo + ", type=" + type + ", enrollDate=" + enrollDate + ", userNo=" + userNo
				+ ", animalNo=" + animalNo + "]";
	}
	
	
	
	

}
