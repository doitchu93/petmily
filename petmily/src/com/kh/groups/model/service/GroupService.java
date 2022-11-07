package com.kh.groups.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.PageInfo;
import com.kh.groups.model.dao.GroupDao;
import com.kh.groups.model.vo.Groups;

public class GroupService {

	public int insertGroup(Groups g) {
		
		Connection conn = getConnection();
		
		int result = new GroupDao().insertGroup(conn, g);
		
		close(conn);
		
		return result;
	}//insertGrouop
	
	public Groups selectGroup(int groupNo) {
		
		Connection conn = getConnection();
		
		Groups group = new GroupDao().selectGroup(conn, groupNo);
		
		close(conn);
		
		return group;
	}//selectGroup
	
	public ArrayList<Groups> selectGroupList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Groups> list = new GroupDao().selectGroupList(conn, pi);
		
		close(conn);
		
		return list;
	}//selectGroupList
	
	public int updateAuthAllow(String groupNo) {
		
		Connection conn = getConnection();
		
		int result = new GroupDao().updateAuthAllow(conn, groupNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//updateAuthAllow
	
	public int updateAuthReject(String groupNo) {
		
		Connection conn = getConnection();
		
		int result = new GroupDao().updateAuthReject(conn, groupNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//updateAuthReject
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int count = new GroupDao().selectListCount(conn);
		
		close(conn);
		
		return count;
	}//selectListCount
	
	public int updateAuthGroup(int userNo) {
		
		Connection conn = getConnection();
		
		int result = new GroupDao().updateAuthGroup(conn, userNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//updateAuthGroup
	
	
	
	
	
}
