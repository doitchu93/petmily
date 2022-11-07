package com.kh.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.community.model.vo.Community;
import com.kh.notice.model.vo.Notice;

public class mainDao {
	
private Properties prop = new Properties();
	
	public mainDao() {
		
		String file = AuthenticationDao.class.getResource("/sql/common/main-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Community> selectAdoptionReview(Connection conn) {
		
		ArrayList<Community> adoptionReviewList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAdoptionReview");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				adoptionReviewList.add(new Community(
						rset.getInt("COM_NO"),
						rset.getString("USER_NICKNAME"),
						rset.getInt("LIKE_COUNT"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE"),
						rset.getString("COM_TITLE"),
						rset.getString("COM_SUMMARY"),
						rset.getInt("COM_TYPE"),
						rset.getString("TITLEIMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return adoptionReviewList;
	}

	public ArrayList<Community> selectVolunteerReview(Connection conn) {

		ArrayList<Community> volunteerReviewList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectVolunteerReview");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				volunteerReviewList.add(new Community(
						rset.getInt("COM_NO"),
						rset.getString("USER_NICKNAME"),
						rset.getInt("LIKE_COUNT"),
						rset.getInt("COUNT"),
						rset.getDate("CREATE_DATE"),
						rset.getString("COM_TITLE"),
						rset.getString("COM_SUMMARY"),
						rset.getInt("COM_TYPE"),
						rset.getString("TITLEIMG")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return volunteerReviewList;
	}

	public ArrayList<Notice> selectNotice(Connection conn) {

		ArrayList<Notice> noticeList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while (rset.next()) {
				
				noticeList.add(new Notice(
						rset.getInt("NOTICE_NO"), 
						rset.getString("NOTICE_TITLE"), 
						rset.getDate("CREATE_DATE")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return noticeList;
	}
	
}
