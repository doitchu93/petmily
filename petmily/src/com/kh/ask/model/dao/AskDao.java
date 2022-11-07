package com.kh.ask.model.dao;

import static com.kh.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.ask.model.vo.*;
import com.kh.common.model.PageInfo;

public class AskDao {
	
	private Properties prop = new Properties();
	public AskDao() {
		String file = AskDao.class.getResource("/sql/ask/ask-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 1:1문의글 등록
	 * @param conn
	 * @param ask
	 * @return
	 */
	public int insertAsk(Connection conn, Ask ask) {
		
		//insert 처리된 행 갯수
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ask.getUserNo());
			pstmt.setInt(2, Integer.parseInt(ask.getAskCategory()));
			pstmt.setString(3, ask.getAskTitle());
			pstmt.setString(4, ask.getAskContent());
			pstmt.setString(5, ask.getAskWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}//insertAsk

	/**
	 * 1:1문의 첨부파일 등록
	 * @param conn
	 * @param at
	 * @return
	 */
	public int insertAttachmentList(Connection conn, Attachment at) {
		
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		
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
	}//insertAttachmentList

	/**
	 * 1:1문의글 목록에 보여줄 문의글 조회하기
	 * @param conn
	 * @return
	 */
	public ArrayList<Ask> selectAskList(Connection conn){
		
		ArrayList<Ask> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAskList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Ask ask = new Ask(
								  rset.getInt("ASK_NO"),
								  rset.getString("CATEGORY_NAME"),
								  rset.getString("ASK_TITLE"),
								  rset.getDate("CREATE_DATE"),
								  rset.getString("REPLY_STATUS"),
								  rset.getString("USER_NAME"));
				list.add(ask);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}//selectAskList
	
	/**
	 * 문의글번호로 조회해서 문의글 상세보기에 띄우기
	 * @param conn
	 * @param askNo
	 * @return
	 */
	public Ask selectAsk(Connection conn, int askNo) {
		
		Ask ask = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				ask = new Ask(
							  rset.getInt("ASK_NO"),
							  rset.getString("CATEGORY_NAME"),
							  rset.getString("ASK_TITLE"),
							  rset.getString("ASK_WRITER"),
							  rset.getString("ASK_CONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return ask;
	}//selectAsk
	
	/**
	 * 카테고리 리스트 조회 : 문의글 수정할 때 사용
	 * @param conn
	 * @return
	 */
	public ArrayList<Category> selectCategoryList(Connection conn){
		
		ArrayList<Category> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCategoryList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Category(
									  rset.getInt("CATEGORY_NO"),
									  rset.getString("CATEGORY_NAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}//selectCategoryList
	
	/**
	 * updateForm에서 수정하기 버튼 클릭시 수정 처리
	 * @param conn
	 * @param ask
	 * @return
	 */
	public int updateAsk(Connection conn, Ask ask) {
		
		//update
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(ask.getAskCategory()));
			pstmt.setString(2, ask.getAskTitle());
			pstmt.setString(3, ask.getAskContent());
			pstmt.setInt(4, ask.getAskNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//updateAsk
	
	/**
	 * REF_NO 참조번호에 대한 ATTACHMENT 테이블 조회
	 * @param conn
	 * @param askNo
	 * @return
	 */
	public Attachment selectAttachmentList(Connection conn, int askNo){
		
		Attachment at = new Attachment();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				at = new Attachment();
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
	}//selectAttachmentList
	
	/**
	 * AskUpdateFormController에서 사용
	 * @param conn
	 * @return
	 */
	public Attachment selectAttachment(Connection conn, int askNo) {
		
		Attachment at = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				at = new Attachment();
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
	}//selectAttachment
	
	public int increaseCount(Connection conn, int askNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//increaseCount
	
	/**
	 * AskUpdateFormController에서 사용
	 * 문의글 수정할 때/ 새롭게 첨부파일이 있을 경우인데/ 기존에 첨부파일이 있었을 경우
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
	 * AskUpdateFormController에서 사용
	 * 문의글 수정할 때/ 새롭게 첨부파일이 있을 경우인데/ 기존에 첨부파일이 없었을 경우
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
			
			pstmt.setInt(1, at.getRefNo());
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
	
	/**
	 * 1:1문의글에 답변 달기
	 * @param conn
	 * @param userNo
	 * @return
	 */
	public int insertReply(Connection conn, Reply r) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, r.getRefRepno());
			pstmt.setString(2, r.getReplyContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;		
	}//insertReply
	
	public Reply selectReply(Connection conn, int askNo) {
		
		Reply reply = new Reply();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				reply = new Reply();
				reply.setReplyContent(rset.getString("REPLY_CONTENT"));
				reply.setRefRepno(rset.getInt("REF_REPNO"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return reply;
	}//selectReply
	
	/**
	 * 관리자 답변이 달리면 리스트 답변상태가 완료로 변경
	 * @param conn
	 * @param askNo
	 * @return
	 */
	public int updateReply(Connection conn, int askNo, String newReplyContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, newReplyContent);
			pstmt.setInt(2, askNo);
			
			result = pstmt.executeUpdate();
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//updateReply
	
	/**
	 * AskListController
	 * 페이징 처리 부분 : 총 게시글 갯수 
	 * @param conn
	 * @return
	 */
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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
	}//selectListCount
	
	/**
	 * RNUM으로 순번을 매김
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Ask> selectList(Connection conn, PageInfo pi){
		
		ArrayList<Ask> askList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow  = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				askList.add(new Ask(rset.getInt("ASK_NO"),
						 		   rset.getString("CATEGORY_NAME"),
						 		   rset.getString("ASK_TITLE"),
						 		   rset.getString("USER_NAME"),
						 		   rset.getDate("CREATE_DATE"),
						 		   rset.getString("ASK_REPLY")
						 		   ));	
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return askList;
	}//selectList
	
	/**
	 * AskListController
	 * 유저 아이디 RNUM 
	 * @param conn
	 * @param id
	 * @return
	 */
	public ArrayList<Ask> selectUserIdList(Connection conn, PageInfo pi, String id){
		
		ArrayList<Ask> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserIdList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow  = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Ask(rset.getInt("ASK_NO"),
						 		   rset.getString("CATEGORY_NAME"),
						 		   rset.getString("ASK_TITLE"),
						 		   rset.getString("USER_NAME"),
						 		   rset.getDate("CREATE_DATE"),
						 		   rset.getString("REPLY_STATUS")));
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}//selectUserIdList
	
	public ArrayList<Reply> selectReplyList(Connection conn){
		
		ArrayList<Reply> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectReplyList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Reply(
									rset.getInt("REF_REPNO"),
									rset.getString("REPLY_STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}//selectReplyList
	
	/**
	 * askListView에 답변상태를 바꿔주는 역할을 도울 것임
	 * @param conn
	 * @param askNo
	 * @return
	 */
	public int updateAskReply(Connection conn, int askNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAskReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}//updateAskReply
	
	public int selectUserIdListCount(Connection conn, int no) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserIdListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, no);
			
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
	}//selectUserIdListCount
	
	
	
}
