package com.kh.adoption.model.vo;

import java.sql.Date;

public class Application {
		private int apNo;//	APPLICATION_NO	NUMBER  -- SEQ_APNO
		private Date apDate;//	APPLICATION_DATE	DATE -- SYSDATE
		private String agreement;//	AGREEMENT	VARCHAR2(1 BYTE)
		private String name;//	APPLICANT_NAME	VARCHAR2(20 BYTE)
		private String phone;//	PHONE	VARCHAR2(20 BYTE)
		private String subPhone;//	SUB_PHONE	VARCHAR2(20 BYTE)
		private String email;//	EMAIL	VARCHAR2(100 BYTE)
		private String gender;//	GENDER	VARCHAR2(1 BYTE)
		private int age;//	AGE	NUMBER
		private String address;//	ADDRESS	VARCHAR2(2000 BYTE)
		private String sns;//	SNS	VARCHAR2(100 BYTE)
		private String job;//	JOB	VARCHAR2(100 BYTE)
		private String maritalStatus;//	MARITAL_STATUS	VARCHAR2(1 BYTE)
		private int animalNo;//	ANIMAL_NO	NUMBER
		private String animalName;//	ANIMAL_NAME	VARCHAR2(20 BYTE)
		private String q2;
		private String q3;
		private String q4;
		private String q5;
		private String q6;
		private String q7;
		private String q8;
		private String q9;
		private String q10;
		private String q11;
		private String q12;
		private String q13;
		private String q14;
		private String q15;
		private String q16;
		private String q17;
		private String q18;
		private String q19;
		private String q20;
		private String status; // 입양신청상태 default 'N'
		private int categoryNo; // 한글 800 영문 900
		private String categoryName;
		
		public Application() {}
	

		public Application(String agreement, String name, String phone, String subPhone, String email, String gender,
				int age, String address, String sns, String job, String maritalStatus, int animalNo, String animalName,
				String q2, String q3, String q4, String q5, String q6, String q7, String q8, String q9, String q10,
				String q11, String q12, String q13, String q14, String q15, String q16, String q17, String q18,
				String q19, String q20, int categoryNo) {
			super();
			this.agreement = agreement;
			this.name = name;
			this.phone = phone;
			this.subPhone = subPhone;
			this.email = email;
			this.gender = gender;
			this.age = age;
			this.address = address;
			this.sns = sns;
			this.job = job;
			this.maritalStatus = maritalStatus;
			this.animalNo = animalNo;
			this.animalName = animalName;
			this.q2 = q2;
			this.q3 = q3;
			this.q4 = q4;
			this.q5 = q5;
			this.q6 = q6;
			this.q7 = q7;
			this.q8 = q8;
			this.q9 = q9;
			this.q10 = q10;
			this.q11 = q11;
			this.q12 = q12;
			this.q13 = q13;
			this.q14 = q14;
			this.q15 = q15;
			this.q16 = q16;
			this.q17 = q17;
			this.q18 = q18;
			this.q19 = q19;
			this.q20 = q20;
			this.categoryNo = categoryNo;
		}



		public Application(int apNo, Date apDate, String agreement, String name, String phone, String subPhone,
				String email, String gender, int age, String address, String sns, String job, String maritalStatus,
				int animalNo, String animalName, String q2, String q3, String q4, String q5, String q6, String q7,
				String q8, String q9, String q10, String q11, String q12, String q13, String q14, String q15,
				String q16, String q17, String q18, String q19, String q20, String status, int categoryNo) {
			super();
			this.apNo = apNo;
			this.apDate = apDate;
			this.agreement = agreement;
			this.name = name;
			this.phone = phone;
			this.subPhone = subPhone;
			this.email = email;
			this.gender = gender;
			this.age = age;
			this.address = address;
			this.sns = sns;
			this.job = job;
			this.maritalStatus = maritalStatus;
			this.animalNo = animalNo;
			this.animalName = animalName;
			this.q2 = q2;
			this.q3 = q3;
			this.q4 = q4;
			this.q5 = q5;
			this.q6 = q6;
			this.q7 = q7;
			this.q8 = q8;
			this.q9 = q9;
			this.q10 = q10;
			this.q11 = q11;
			this.q12 = q12;
			this.q13 = q13;
			this.q14 = q14;
			this.q15 = q15;
			this.q16 = q16;
			this.q17 = q17;
			this.q18 = q18;
			this.q19 = q19;
			this.q20 = q20;
			this.status = status;
			this.categoryNo = categoryNo;
		}
		
		

		public Application(int apNo, Date apDate, String name, String phone, int animalNo, String animalName,
				String status, int categoryNo, String categoryName) {
			super();
			this.apNo = apNo;
			this.apDate = apDate;
			this.name = name;
			this.phone = phone;
			this.animalNo = animalNo;
			this.animalName = animalName;
			this.status = status;
			this.categoryNo = categoryNo;
			this.categoryName = categoryName;
		}


		public int getApNo() {
			return apNo;
		}

		public void setApNo(int apNo) {
			this.apNo = apNo;
		}

		public Date getApDate() {
			return apDate;
		}

		public void setApDate(Date apDate) {
			this.apDate = apDate;
		}

		public String getAgreement() {
			return agreement;
		}

		public void setAgreement(String agreement) {
			this.agreement = agreement;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getSubPhone() {
			return subPhone;
		}

		public void setSubPhone(String subPhone) {
			this.subPhone = subPhone;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getGender() {
			return gender;
		}

		public void setGender(String gender) {
			this.gender = gender;
		}

		public int getAge() {
			return age;
		}

		public void setAge(int age) {
			this.age = age;
		}

		public String getAddress() {
			return address;
		}

		public void setAddress(String address) {
			this.address = address;
		}

		public String getSns() {
			return sns;
		}

		public void setSns(String sns) {
			this.sns = sns;
		}

		public String getJob() {
			return job;
		}

		public void setJob(String job) {
			this.job = job;
		}

		public String getMaritalStatus() {
			return maritalStatus;
		}

		public void setMaritalStatus(String maritalStatus) {
			this.maritalStatus = maritalStatus;
		}

		public int getAnimalNo() {
			return animalNo;
		}

		public void setAnimalNo(int animalNo) {
			this.animalNo = animalNo;
		}

		public String getAnimalName() {
			return animalName;
		}

		public void setAnimalName(String animalName) {
			this.animalName = animalName;
		}

		public String getQ2() {
			return q2;
		}

		public void setQ2(String q2) {
			this.q2 = q2;
		}

		public String getQ3() {
			return q3;
		}

		public void setQ3(String q3) {
			this.q3 = q3;
		}

		public String getQ4() {
			return q4;
		}

		public void setQ4(String q4) {
			this.q4 = q4;
		}

		public String getQ5() {
			return q5;
		}

		public void setQ5(String q5) {
			this.q5 = q5;
		}

		public String getQ6() {
			return q6;
		}

		public void setQ6(String q6) {
			this.q6 = q6;
		}

		public String getQ7() {
			return q7;
		}

		public void setQ7(String q7) {
			this.q7 = q7;
		}

		public String getQ8() {
			return q8;
		}

		public void setQ8(String q8) {
			this.q8 = q8;
		}

		public String getQ9() {
			return q9;
		}

		public void setQ9(String q9) {
			this.q9 = q9;
		}

		public String getQ10() {
			return q10;
		}

		public void setQ10(String q10) {
			this.q10 = q10;
		}

		public String getQ11() {
			return q11;
		}

		public void setQ11(String q11) {
			this.q11 = q11;
		}

		public String getQ12() {
			return q12;
		}

		public void setQ12(String q12) {
			this.q12 = q12;
		}

		public String getQ13() {
			return q13;
		}

		public void setQ13(String q13) {
			this.q13 = q13;
		}

		public String getQ14() {
			return q14;
		}

		public void setQ14(String q14) {
			this.q14 = q14;
		}

		public String getQ15() {
			return q15;
		}

		public void setQ15(String q15) {
			this.q15 = q15;
		}

		public String getQ16() {
			return q16;
		}

		public void setQ16(String q16) {
			this.q16 = q16;
		}

		public String getQ17() {
			return q17;
		}

		public void setQ17(String q17) {
			this.q17 = q17;
		}

		public String getQ18() {
			return q18;
		}

		public void setQ18(String q18) {
			this.q18 = q18;
		}

		public String getQ19() {
			return q19;
		}

		public void setQ19(String q19) {
			this.q19 = q19;
		}

		public String getQ20() {
			return q20;
		}

		public void setQ20(String q20) {
			this.q20 = q20;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public int getCategoryNo() {
			return categoryNo;
		}

		public void setCategoryNo(int categoryNo) {
			this.categoryNo = categoryNo;
		}
		

		public String getCategoryName() {
			return categoryName;
		}


		public void setCategoryName(String categoryName) {
			this.categoryName = categoryName;
		}


		@Override
		public String toString() {
			return "Application [apNo=" + apNo + ", apDate=" + apDate + ", agreement=" + agreement + ", name="
					+ name + ", phone=" + phone + ", subPhone=" + subPhone + ", email=" + email + ", gender=" + gender
					+ ", age=" + age + ", address=" + address + ", sns=" + sns + ", job=" + job + ", maritalStatus="
					+ maritalStatus + ", animalNo=" + animalNo + ", animalName=" + animalName + ", q2=" + q2 + ", q3="
					+ q3 + ", q4=" + q4 + ", q5=" + q5 + ", q6=" + q6 + ", q7=" + q7 + ", q8=" + q8 + ", q9=" + q9
					+ ", q10=" + q10 + ", q11=" + q11 + ", q12=" + q12 + ", q13=" + q13 + ", q14=" + q14 + ", q15="
					+ q15 + ", q16=" + q16 + ", q17=" + q17 + ", q18=" + q18 + ", q19=" + q19 + ", q20=" + q20
					+ ", status=" + status + ", categoryNo=" + categoryNo + "]";
		}
		
		

}
