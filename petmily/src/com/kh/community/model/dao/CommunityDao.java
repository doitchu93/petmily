package com.kh.community.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.common.JDBCTemplate.*;
import com.kh.adoption.model.dao.AdoptionDao;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;
import com.kh.community.model.vo.Community;

public class CommunityDao {
	private Properties prop = new Properties();

	public CommunityDao() {
		String file = AdoptionDao.class.getResource("/sql/community/community-mapper.xml").getPath();
	
		try {
		prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
		e.printStackTrace();
		}
	}

	/**
	 * 게시글 등록
	 */
	public int insertCommuniy(Connection conn, Community c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(c.getUserNo()));
			pstmt.setString(2, c.getTitle());
			pstmt.setString(3, c.getSummary());
			pstmt.setString(4, c.getContent());
			pstmt.setInt(5, c.getType());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시글 사진 등록
	 */
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		
			try {
				for(Attachment at : list) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, at.getOriginName());
					pstmt.setString(2, at.getChangeName());
					pstmt.setString(3, at.getFilePath());
					pstmt.setInt(4, at.getFileLevel());
					pstmt.setString(5, "CM"); // 커뮤니티
					
					result *= pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		return result;
	}

	public int selectListCount(Connection conn, int type) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listCount;
	}

	/**
	 * 게시글 목록
	 */
	public ArrayList<Community> selectList(Connection conn, PageInfo pi, int type) {
		ArrayList<Community> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, type);
			pstmt.setString(2, "CM"); // 커뮤니티
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Community(
										rset.getInt("COM_NO"),
										rset.getString("USER_NICKNAME"),
										rset.getInt("LIKE_COUNT"),
										rset.getInt("COUNT"),
										rset.getDate("CREATE_DATE"),
										rset.getString("COM_TITLE"),
										rset.getString("COM_SUMMARY"),
										rset.getInt("COM_TYPE"),
										rset.getString("TITLEIMG")
										));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	/**
	 * 조회수 올리기
	 */
	public int increaseCount(Connection conn, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**\
	 * 게시글 상세보기
	 */
	public Community selectCommunity(Connection conn, int cno, int type) {
		Community c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setInt(2, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Community(rset.getInt("COM_NO"),
								  rset.getString("USER_NICKNAME"),
								  rset.getInt("LIKE_COUNT"),
								  rset.getInt("COUNT"),
								  rset.getDate("CREATE_DATE"),
								  rset.getString("COM_TITLE"),
								  rset.getString("COM_SUMMARY"),
								  rset.getString("COM_CONTENT"),
								  rset.getInt("COM_TYPE")
								 );
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		return c;
	}

	/**
	 * 게시글 상세보기 - 사진
	 */
	public ArrayList<Attachment> selectAttachment(Connection conn, int cno) {
		ArrayList<Attachment> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setString(2, "CM"); // 입양게시판타입
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Attachment(										
						rset.getInt("FILE_NO"),
						rset.getString("ORIGIN_NAME"),
						rset.getString("CHANGE_NAME"),
						rset.getString("FILE_PATH")	
						));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	/**
	 * 좋아요
	 */
	public int updateLike(Connection conn, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 * 게시글수정
	 */
	public int updateCommunity(Connection conn, Community c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, c.getTitle());
			pstmt.setString(2, c.getSummary());
			pstmt.setString(3, c.getContent());
			pstmt.setInt(4, c.getComNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 첨부파일 완전 삭제
	 */
	public int removeAttachmentList(Connection conn, int comNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("removeAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comNo);
			pstmt.setString(2, "CM");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 새로운 첨부파일
	 */
	public int insertNewAttachmentList(Connection conn, ArrayList<Attachment> list, int comNo) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachmentList");
		
		try {
			for(Attachment at : list) {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, comNo);
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());
				pstmt.setInt(5, at.getFileLevel());
				pstmt.setString(6, "CM");
				
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	/**
	 *  게시글삭제 - 첨부파일삭제(status Y -> N)
	 */
	public int deleteAttachmentList(Connection conn, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			pstmt.setString(2, "CM");
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 *  게시글삭제 - status Y->N
	 */
	public int deleteCommunity(Connection conn, int cno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteCommunity");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
