package com.kh.member.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.board.model.vo.Attachment2;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() {
		
		String file = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
		
		try {
			
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member loginMember(Connection conn, String userId, String userPwd) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				m = new Member(rset.getInt("USER_NO"),
							   rset.getString("USER_ID"),
							   rset.getString("USER_PWD"),
							   rset.getString("USER_NAME"),
							   rset.getString("USER_NICKNAME"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getString("BIRTH_DATE"),
							   rset.getString("EMAIL"),
							   rset.getString("POSTCODE"),
							   rset.getString("ADDRESS_MAIN"),
							   rset.getString("ADDRESS_DETAIL"),
							   rset.getString("ADDRESS_ADD"),
							   rset.getString("PHONE"),
							   rset.getString("STATUS"),
							   rset.getString("CLASS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getUserId());
			pstmt.setString(2, m.getUserPwd());
			pstmt.setString(3, m.getUserName());
			pstmt.setString(4, m.getUserNickname());
			pstmt.setString(5, m.getBirthDate());
			pstmt.setString(6, m.getEmail());
			pstmt.setString(7, m.getPostcode());
			pstmt.setString(8, m.getAddressMain());
			pstmt.setString(9, m.getAddressDetail());
			pstmt.setString(10, m.getAddressAdd());
			pstmt.setString(11, m.getPhone());
			pstmt.setString(12, m.getUserClass());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkId(Connection conn, String inputId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkId");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputId);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				result++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int checkEmail(Connection conn, String inputEmail) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkEmail");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputEmail);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				result++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int checkNickname(Connection conn, String inputNickname) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkNickname");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputNickname);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				result++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int checkPhone(Connection conn, String inputPhone) {

		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkPhone");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputPhone);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				result++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public String findIdMember(Connection conn, Member inputList) {
		
		String userId = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findIdMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputList.getUserName());
			pstmt.setString(2, inputList.getPhone());
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				userId = rset.getString("USER_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userId;
	}

	public int findPwdMember(Connection conn, Member inputList) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findPwdMember");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputList.getUserPwd());
			pstmt.setString(2, inputList.getUserName());
			pstmt.setString(3, inputList.getPhone());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int checkEmailFindPwd(Connection conn, Member inputList) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkEmailFindPwd");
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, inputList.getEmail());
			pstmt.setString(2, inputList.getUserName());
			pstmt.setString(3, inputList.getPhone());
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				
				result++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteMember(Connection conn, String userId, String userPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateProfile(Connection conn, String userNo, String nickname) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, nickname);
			pstmt.setInt(2, Integer.parseInt(userNo));
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
			return result;
		
	}
	
	

	

	public int updatePwd(Connection conn, String userNo, String userPwd, String newPwd, String checkPwd) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updatePwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newPwd);
			pstmt.setInt(2, Integer.parseInt(userNo));
			pstmt.setString(3, userPwd);
			pstmt.setString(4, newPwd);
			pstmt.setString(5, checkPwd);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		
		return result;
		
		
	}

	public int insertProfileImg(Connection conn, String userNo, Attachment2 at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertProfileImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(userNo));
			pstmt.setString(2, at.getOriginName());
			pstmt.setString(3, at.getChangeName());
			pstmt.setString(4, at.getFilePath());
			pstmt.setInt(5, at.getFileLevel());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public Attachment2 selectAttachment(Connection conn, int userNo) {

		Attachment2 at = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				at = new Attachment2();
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return at;
		
	}

	public int updateProfileImg(Connection conn, String userNo, Attachment2 at) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateProfileImg");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, at.getOriginName());
			pstmt.setString(2, at.getChangeName());
			pstmt.setInt(3, Integer.parseInt(userNo));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;

	}
	
	public int updateMember(Connection conn, int userNo, String userNickname, Member m) {

        int result = 0;
        PreparedStatement pstmt = null;

        String sql = prop.getProperty("updateMember");

        try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, userNickname);
            pstmt.setString(2, m.getPostcode());
            pstmt.setString(3, m.getAddressMain());
            pstmt.setString(4, m.getAddressDetail());
            pstmt.setString(5, m.getAddressAdd());
            pstmt.setInt(6, userNo);

            result = pstmt.executeUpdate();


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

        return result;
    }
	
}
