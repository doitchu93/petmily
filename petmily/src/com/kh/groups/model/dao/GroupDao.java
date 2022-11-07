package com.kh.groups.model.dao;

import static com.kh.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.model.PageInfo;
import com.kh.groups.model.vo.Groups;

public class GroupDao {

	private Properties prop = new Properties();
	public GroupDao() {
		String file = GroupDao.class.getResource("/sql/groups/group-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 단체신청 게시글 등록
	 * @param conn
	 * @param g
	 * @return
	 */
	public int insertGroup(Connection conn, Groups g) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertGroup");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, g.getUserNo());
			pstmt.setString(2, g.getUserName());
			pstmt.setString(3, g.getGroupName());
			pstmt.setString(4, g.getUserPhone());
			pstmt.setString(5, g.getGroupEnrollno());
			pstmt.setString(6, g.getGroupUrl());
			pstmt.setString(7, g.getGroupEtc());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
	}//insertGroup
	
	/**
	 * GroupDetailController
	 * 단체신청 글 상세보기
	 * @param conn
	 * @param groupNo
	 * @return
	 */
	public Groups selectGroup(Connection conn, int groupNo) {
		
		Groups group = new Groups();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectGroup");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, groupNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				group = new Groups(rset.getInt("GROUP_NO"),
								   rset.getString("GROUP_NAME"),
								   rset.getString("USER_NAME"),
								   rset.getInt("USER_NO"),
								   rset.getString("USER_PHONE"),
								   rset.getString("GROUP_ENROLL_NO"),
								   rset.getString("GROUP_URL"),
								   rset.getString("GROUP_ETC"),
								   rset.getString("GROUP_AUTH"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return group;
	}//selectGroup
	
	/**
	 * GroupListController
	 * @param conn
	 * @return
	 */
	public ArrayList<Groups> selectGroupList(Connection conn, PageInfo pi){
		
		ArrayList<Groups> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectGroupList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow  = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Groups(rset.getInt("GROUP_NO"),
										  rset.getDate("CREATE_DATE"),
										  rset.getString("USER_NAME"),
										  rset.getString("GROUP_NAME"),
										  rset.getString("GROUP_AUTH"))); 
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}//selectGroupList
	
	/**
	 * GroupAuthController
	 * 승인 버튼을 누르면 승인상태를 N -> Y로 변경
	 * @param conn
	 * @param groupNo
	 * @return
	 */
	public int updateAuthAllow(Connection conn, String groupNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAuthAllow");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(groupNo));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//updateAuthAllow
	
	public int updateAuthReject(Connection conn, String groupNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAuthReject");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(groupNo));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//updateAuthReject
	
	public int selectListCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return count;
	}//selectListCount
	
	public int updateAuthGroup(Connection conn, int userNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAuthGroup");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
		
	}//updateAuthGroup
	
	
	
}
