package com.kh.common.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;
import com.kh.common.model.vo.Authentication;

public class AuthenticationDao {
	
	private Properties prop = new Properties();
	
	public AuthenticationDao() {
		
		String file = AuthenticationDao.class.getResource("/sql/common/authentication-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertAuthentication(Connection conn, Authentication list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAuthentication");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, list.getEmail());
			pstmt.setString(2, list.getRandomCode());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Authentication checkRandomCode(Connection conn, String inputEmail) {
		
		Authentication resultList = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkRandomCode");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputEmail);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				resultList = new Authentication(rset.getString("RANDOM_CODE"), 
						                        rset.getTimestamp("ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return resultList;
	}

}
