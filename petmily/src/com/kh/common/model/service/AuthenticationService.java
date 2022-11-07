package com.kh.common.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.dao.AuthenticationDao;
import com.kh.common.model.vo.Authentication;

public class AuthenticationService {

	public int insertAuthentication(Authentication list) {
		
		Connection conn = getConnection();
		
		int result = new AuthenticationDao().insertAuthentication(conn, list);
		
		if (result > 0) commit(conn);
		
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	public Authentication checkRandomCode(String inputEmail) {
		
		Connection conn = getConnection();
		
		Authentication resultList = new AuthenticationDao().checkRandomCode(conn, inputEmail);
		
		close(conn);
		
		return resultList;
	}

}
