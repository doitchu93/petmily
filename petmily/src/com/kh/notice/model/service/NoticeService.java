package com.kh.notice.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.ask.model.dao.AskDao;
import com.kh.ask.model.vo.Attachment;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

public class NoticeService {
	
	public int insertNotice(Notice notice, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().insertNotice(conn, notice);
		int result2 = 1;
		if(at != null) {
			result2 = new NoticeDao().insertAttachment(conn, at);
		}
		
		int result = result1 * result2;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//insertNotice

	public ArrayList<Notice> selectNoticeList(){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNoticeList(conn);
		
		close(conn);
		
		return list;
	}//selectNoticeList
	
	public Notice selectNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		Notice notice = new NoticeDao().selectNotice(conn, noticeNo);
		
		close(conn);
		
		return notice;
	}//selectNotice
	
	public int increaseCount(int noticeNo) {
		
		Connection conn = getConnection();
		
		int count = new NoticeDao().increaseCount(conn, noticeNo);
		
		if(count > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return count;
	}//increaseCount
	
	public Attachment selectAttachment(int noticeNo) {
		
		Connection conn = getConnection();
		
		Attachment at = new NoticeDao().selectAttachment(conn, noticeNo);
		
		close(conn);
		
		return at;
	}//selectAttachment
	
	public int updateNotice(Notice notice, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new NoticeDao().updateNotice(conn, notice);
		int result2 = 1;
		
		// 새롭게 첨부파일이 있을 경우
		if(at != null) {
			
			// 기존에 첨부파일이 있었을 경우
			if(at.getFileNo() != 0) {
				result2 = new NoticeDao().updateAttachment(conn, at);
			}else {
				result2 = new NoticeDao().insertNewAttachment(conn, at);
			}
		}// 아닐 경우 Attachment에다가 뭐 해줄 일이 없으니 else구문 X

		int result = result1 * result2;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//updateNotices
	
	public int deleteNotice(int noticeNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(conn, noticeNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//deleteNotice
}
