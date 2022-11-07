package com.kh.community.model.vo;

import java.sql.Date;

public class Community {
		private int comNo; //COM_NO	NUMBER 게시글 번호
		private String userNo; //USER_NO	NUMBER 작성자 번호
		private int likeCount; //LIKE_COUNT	NUMBER 좋아요 수
		private int viewCount; //COUNT	NUMBER 조회수
		private Date createDate; //CREATE_DATE	DATE 작성일
		private String title;//COM_TITLE	VARCHAR2(100 BYTE) 제목
		private String summary; //COM_SUMMARY	VARCHAR2(1000 BYTE) 요약 - 썸네일에 보여질 내용
		private String content; //COM_CONTENT	VARCHAR2(4000 BYTE) 내용
		private int type;//COM_TYPE	NUMBER 게시글타입 : 1. 입양후기 2. 봉사후기 3. 봉사모집
		private String status; //STATUS	VARCHAR2(1 BYTE) 게시글상태 : /N : 삭제
		private String titleImg;
		
		public Community() {}

		public Community(int comNo, String userNo, int likeCount, int viewCount, Date createDate, String title,
				String summary, String content, int type, String status) {
			this.comNo = comNo;
			this.userNo = userNo;
			this.likeCount = likeCount;
			this.viewCount = viewCount;
			this.createDate = createDate;
			this.title = title;
			this.summary = summary;
			this.content = content;
			this.type = type;
			this.status = status;
		}
		
		
		public Community(String userNo, String title, String summary, String content, int type) {
			this.userNo = userNo;
			this.title = title;
			this.summary = summary;
			this.content = content;
			this.type = type;
		}
		
		

		public Community(int comNo, String userNo, int likeCount, int viewCount, Date createDate, String title,
				String summary, String content, int type, String status, String titleImg) {
			this.comNo = comNo;
			this.userNo = userNo;
			this.likeCount = likeCount;
			this.viewCount = viewCount;
			this.createDate = createDate;
			this.title = title;
			this.summary = summary;
			this.content = content;
			this.type = type;
			this.status = status;
			this.titleImg = titleImg;
		}

		
		public Community(int comNo, String userNo, int likeCount, int viewCount, Date createDate, String title,
				String summary, String titleImg) {
			this.comNo = comNo;
			this.userNo = userNo;
			this.likeCount = likeCount;
			this.viewCount = viewCount;
			this.createDate = createDate;
			this.title = title;
			this.summary = summary;
			this.titleImg = titleImg;
		}

		
		public Community(int comNo, String userNo, int likeCount, int viewCount, Date createDate, String title,
				String summary, int type, String titleImg) {
			this.comNo = comNo;
			this.userNo = userNo;
			this.likeCount = likeCount;
			this.viewCount = viewCount;
			this.createDate = createDate;
			this.title = title;
			this.summary = summary;
			this.type = type;
			this.titleImg = titleImg;
		}

		public Community(int comNo, String userNo, int likeCount, int viewCount, Date createDate, String title,
				String content, int type) {
			this.comNo = comNo;
			this.userNo = userNo;
			this.likeCount = likeCount;
			this.viewCount = viewCount;
			this.createDate = createDate;
			this.title = title;
			this.content = content;
			this.type = type;
		}
		
		public int getComNo() {
			return comNo;
		}

		public Community(int comNo, String userNo, int likeCount, int viewCount, Date createDate, String title,
				String summary, String content, int type) {
			this.comNo = comNo;
			this.userNo = userNo;
			this.likeCount = likeCount;
			this.viewCount = viewCount;
			this.createDate = createDate;
			this.title = title;
			this.summary = summary;
			this.content = content;
			this.type = type;
		}

		public Community(int comNo, String userNo, String title, String summary, String content, int type) {
			this.comNo = comNo;
			this.userNo = userNo;
			this.title = title;
			this.summary = summary;
			this.content = content;
			this.type = type;
		}

		public void setComNo(int comNo) {
			this.comNo = comNo;
		}

		public String getUserNo() {
			return userNo;
		}

		public void setUserNo(String userNo) {
			this.userNo = userNo;
		}

		public int getLikeCount() {
			return likeCount;
		}

		public void setLikeCount(int likeCount) {
			this.likeCount = likeCount;
		}

		public int getViewCount() {
			return viewCount;
		}

		public void setViewCount(int viewCount) {
			this.viewCount = viewCount;
		}

		public Date getCreateDate() {
			return createDate;
		}

		public void setCreateDate(Date createDate) {
			this.createDate = createDate;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getSummary() {
			return summary;
		}

		public void setSummary(String summary) {
			this.summary = summary;
		}

		public String getContent() {
			return content;
		}

		public void setContent(String content) {
			this.content = content;
		}

		public int getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}
		
		public String getTitleImg() {
			return titleImg;
		}

		public void setTitleImg(String titleImg) {
			this.titleImg = titleImg;
		}

		@Override
		public String toString() {
			return "community [comNo=" + comNo + ", userNo=" + userNo + ", likeCount=" + likeCount + ", viewCount="
					+ viewCount + ", createDate=" + createDate + ", title=" + title + ", summary=" + summary
					+ ", content=" + content + ", type=" + type + ", status=" + status + "]";
		}
		
		
}
