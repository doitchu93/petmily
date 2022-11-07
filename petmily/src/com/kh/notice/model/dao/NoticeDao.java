package com.kh.notice.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.ask.model.vo.Attachment;
import com.kh.notice.model.vo.Notice;

public class NoticeDao {
	
	/*
	 * insertNotice
	 * insertAttachment
	 * selectNoticeList
	 * selectNotice
	 * increaseCount
	 * selectAttachment
	 * updateNotice
	 * updateAttachment
	 * insertNewAttachment
	 * deleteNotice
	 */
	private Properties prop = new Properties();
	public NoticeDao() {
		String file = NoticeDao.class.getResource("/sql/notice/notice-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * NoticeInsertController
	 * 공지사항 등록 
	 * @param conn
	 * @param notice
	 * @param at
	 * @return
	 */
	public int insertNotice(Connection conn, Notice notice) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//insertNotice
	
	/**
	 * 공지사항 첨부파일 등록
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//insertAttachment
	
	public ArrayList<Notice> selectNoticeList(Connection conn){
		
		ArrayList<Notice> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNoticeList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice notice = new Notice(rset.getInt("NOTICE_NO"),
						   				   rset.getDate("CREATE_DATE"),
						   				   rset.getString("NOTICE_TITLE"),
						   				   rset.getInt("COUNT"));
				list.add(notice);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}//selectNoticeList
	
	/**
	 * NoticeDetailController
	 * noticeNo 받아서 공지글 정보 조회
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public Notice selectNotice(Connection conn, int noticeNo) {
		
		Notice notice = new Notice();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				notice = new Notice(rset.getInt("NOTICE_NO"),
									rset.getString("NOTICE_TITLE"),
						   			rset.getString("NOTICE_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return notice;
	}//selectNotice

	/**
	 * NoticeDetailController
	 * 조회수
	 * @param conn
	 * @param noticeNo
	 * @return
	 */
	public int increaseCount(Connection conn, int noticeNo) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			count = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return count;
	}//increaseCount
	
	public Attachment selectAttachment(Connection conn, int noticeNo) {
		
		Attachment at = new Attachment();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				at = new Attachment(rset.getInt("FILE_NO"),
							   rset.getString("ORIGIN_NAME"),
							   rset.getString("CHANGE_NAME"),
							   rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return at;
	}//selectAttachment
	
	/**
	 * 공지사항 수정
	 * @param conn
	 * @param notice
	 * @return
	 */
	public int updateNotice(Connection conn, Notice notice) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setInt(3, notice.getNoticeNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//updateNotice
	
	/**
	 * 공지글 수정
	 * 새로 첨부를 하는데 기존에 첨부파일이 있었을 경우
	 * @param conn
	 * @param at
	 * @return
	 */
	public int updateAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setString(3, at.getFilePath());
			pstmt.setInt(4, at.getFileNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//updateAttachment
	
	/**
	 * 공지글 수정
	 * 새롭게 첨부를 하는데 기존에 첨부파일이 없었을 경우
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertNewAttachment(Connection conn, Attachment at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, at.getRefNoNotice());
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//insertNewAttachment
	
	public int deleteNotice(Connection conn, int noticeNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//deleteNotice
	
}
