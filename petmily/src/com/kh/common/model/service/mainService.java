package com.kh.common.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.dao.mainDao;
import com.kh.community.model.vo.Community;
import com.kh.notice.model.vo.Notice;

public class mainService {

	public ArrayList<Community> selectAdoptionReview() {
		
		Connection conn = getConnection();
		
		ArrayList<Community> adoptionReviewList = new mainDao().selectAdoptionReview(conn);
		
		close(conn);
		
		return adoptionReviewList;
	}

	public ArrayList<Community> selectVolunteerReview() {

		Connection conn = getConnection();
		
		ArrayList<Community> volunteerReviewList = new mainDao().selectVolunteerReview(conn);
		
		close(conn);
		
		return volunteerReviewList;
	}

	public ArrayList<Notice> selectNotice() {

		Connection conn = getConnection();
		
		ArrayList<Notice> noticeList = new mainDao().selectNotice(conn);
		
		close(conn);
		
		return noticeList;
	}

}
