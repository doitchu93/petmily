package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.board.controller.interListAnimal;
import com.kh.board.model.vo.Attachment2;
import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		Member m = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return m;
	}
	

	
	public int checkEmail(String inputEmail) {
		
		Connection conn = getConnection();
		int result = new MemberDao().checkEmail(conn, inputEmail);
		
		close(conn);
		
		return result;
	}

	public int checkNickname(String inputNickname) {
		
		Connection conn = getConnection();
		int result = new MemberDao().checkNickname(conn, inputNickname);
		
		close(conn);
		
		return result;
	}
	
	public int checkPhone(String inputPhone) {
		
		Connection conn = getConnection();
		int result = new MemberDao().checkPhone(conn, inputPhone);
		
		close(conn);
		
		return result;
	}

	public String findIdMember(Member inputList) {
		
		Connection conn = getConnection();
		String userId = new MemberDao().findIdMember(conn, inputList);
		
		close(conn);
		
		return userId;
	}

	public int findPwdMember(Member inputList) {

		Connection conn = getConnection();
		int result = new MemberDao().findPwdMember(conn, inputList);
		
		close(conn);
		
		return result;
	}

	public int checkEmailFindPwd(Member inputList) {
		
		Connection conn = getConnection();
		int result = new MemberDao().checkEmailFindPwd(conn, inputList);
		
		close(conn);
		
		return result;
	}
	
	public int deleteMember(String userId, String userPwd) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, userId, userPwd);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	public int updateProfile(String userNo, String nickname, Attachment2 at) {
		
		Connection conn = getConnection();
		
		int result1 = new MemberDao().updateProfile(conn, userNo, nickname);
		
		int result2 = 0;
		
		Attachment2 at2 = new MemberDao().selectAttachment(conn, Integer.parseInt(userNo));
		
			if(at2 == null) {
				
				result2 = new MemberDao().insertProfileImg(conn, userNo, at);
				
			} else {
				
				result2 = new MemberDao().updateProfileImg(conn, userNo, at);
				
			}
		
		if(result1 * result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return (result1 * result2);
		
	}

	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		
		if (result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	public int checkId(String inputId) {
		
		Connection conn = getConnection();
		int result = new MemberDao().checkId(conn, inputId);
		
		close(conn);
		
		return result;
	}





	public int updatePwd(String userNo, String userPwd, String newPwd, String checkPwd) {

		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, userNo, userPwd, newPwd, checkPwd);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
		
		
	}

	public Attachment2 selectAttachment(int userNo) {

		Connection conn = getConnection();
		
		Attachment2 at = new MemberDao().selectAttachment(conn, userNo);
		
		close(conn);
		
		return at;
		
	}
	
	public int updateMember(int userNo, String userNickname, Member m) {

        Connection conn = getConnection();

        int result = new MemberDao().updateMember(conn, userNo, userNickname, m);

        close(conn);

        return result;


    }



	public int updateNickname(String userNo, String nickname) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateProfile(conn, userNo, nickname);
		
		close(conn);
		
		return result;
		
		
	}
	
}
