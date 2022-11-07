package com.kh.community.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.dao.CommunityDao;
import com.kh.community.model.vo.Community;

public class CommunityService {

	/**
	 * 입양후기/봉사후기/봉사모집 게시글 작성
	 */
	public int insertCommunity(Community c, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new CommunityDao().insertCommuniy(conn, c);
		int result2 = new CommunityDao().insertAttachmentList(conn, list);
		
		if(result1 * 2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}

	/**
	 * 총 게시글 수 조회 
	 * type : 1 // 입양후기게시판
	 */
	public int selectListCount(int type) {
		Connection conn = getConnection();
		int listCount = new CommunityDao().selectListCount(conn, type);
		close(conn);
		return listCount;
	}

	/**
	 * 게시글 목록 불러오기 
	 * type : 1 // 입양후기게시판
	 */
	public ArrayList<Community> selectList(PageInfo pi, int type) {
		Connection conn = getConnection();
		ArrayList<Community> list = new CommunityDao().selectList(conn, pi, type);
		close(conn);
		return list;
	}

	/**
	 * 게시글 상세보기 - 조회수 증가
	 */
	public int increaseCount(int cno) {
		Connection conn = getConnection();
		int result = new CommunityDao().increaseCount(conn, cno);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	/**
	 * 게시글 상세보기
	 * type : 1 // 입양후기게시판
	 */
	public Community selectCommunity(int cno, int type) {
		Connection conn = getConnection();
		Community c = new CommunityDao().selectCommunity(conn, cno, type);
		close(conn);
		return c;
	}

	/**
	 * 게시글 상세보기 - 사진
	 */
	public ArrayList<Attachment> selectAttachment(int cno) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new CommunityDao().selectAttachment(conn, cno);
		close(conn);
		return list;
	}

	/**
	 * 좋아요 수 올리기
	 */
	public int updateLike(int cno) {
		Connection conn = getConnection();
		int result = new CommunityDao().updateLike(conn, cno);
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	/**
	 * 게시글 수정
	 */
	public int updateCommunity(Community c, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new CommunityDao().updateCommunity(conn, c);
		int result2 = 1;
		
		if(!list.isEmpty()) {
			int result3 = new CommunityDao().removeAttachmentList(conn, c.getComNo());
			int result4 = 1;
			if(result3 > 0) {
				result4 = new CommunityDao().insertNewAttachmentList(conn, list, c.getComNo());
			}
			result2 = result3 * result4;
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}

	/**
	 * 게시글 삭제
	 */
	public int deleteCommunity(int cno) {
		Connection conn = getConnection();
		int result1 = new CommunityDao().deleteAttachmentList(conn, cno);
		int result2 = new CommunityDao().deleteCommunity(conn, cno);
		
		if(result1 * result2 > 0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}


	
	
	
	
	
	
	
	
	
	

}
