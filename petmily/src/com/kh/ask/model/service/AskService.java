package com.kh.ask.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.ask.model.dao.AskDao;
import com.kh.ask.model.vo.Ask;
import com.kh.ask.model.vo.Attachment;
import com.kh.ask.model.vo.Category;
import com.kh.ask.model.vo.Reply;
import com.kh.common.model.PageInfo;
import com.kh.notice.model.dao.NoticeDao;

public class AskService {
	
	public int insertAsk(Ask ask, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new AskDao().insertAsk(conn, ask);
		int result2 = 1;
		
		if(at != null) {
			result2 = new AskDao().insertAttachmentList(conn, at);
		}
		
		int result = result1 * result2;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}//insertAsk
	
	public ArrayList<Ask> selectAskList(){
		
		Connection conn = getConnection();
		
		ArrayList<Ask> list = new AskDao().selectAskList(conn);
		
		close(conn);
		
		return list;
	}//selectAskList
	
	public Ask selectAsk(int askNo) {
		
		Connection conn = getConnection();
		
		Ask ask = new AskDao().selectAsk(conn, askNo);
		
		close(conn);
		
		return ask;
	}//selectAsk
	
	public ArrayList<Category> selectCategoryList(){
		
		Connection conn = getConnection();
		
		ArrayList<Category> list = new AskDao().selectCategoryList(conn);
		
		close(conn);
		
		return list;		
	}//selectCategoryList
	
	public int updateAsk(Ask ask, Attachment at) {
		
		Connection conn = getConnection();
		
		int result1 = new AskDao().updateAsk(conn, ask);
		int result2 = 1; // 첨부파일이 없어도 ask update는 진행되야 하기 때문
		
		// 새롭게 첨부파일이 있을 경우
		if(at != null) {
			
			// 기존에 첨부파일이 있었을 경우
			if(at.getFileNo() != 0) {
				result2 = new AskDao().updateAttachment(conn, at);
			}else {
				result2 = new AskDao().insertNewAttachment(conn, at);
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
	}//updateAsk
	
	public Attachment selectAttachmentList(int askNo){
		
		Connection conn = getConnection();
		
		Attachment at = new AskDao().selectAttachmentList(conn, askNo);
		
		close(conn);
		
		return at;
	}//selectAttachmentList
	
	public Attachment selectAttachment(int askNo) {
		
		Connection conn = getConnection();
		
		Attachment at = new AskDao().selectAttachment(conn, askNo);
		
		close(conn);
		
		return at;
	}//selectAttachment
	
	public int increaseCount(int askNo) {
		
		Connection conn = getConnection();
		
		int result = new AskDao().increaseCount(conn, askNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//increaseCount
	
	public int insertReply(Reply r) {
		
		Connection conn = getConnection();
		
		int result = new AskDao().insertReply(conn, r);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//insertReply
	
	public Reply selectReply(int askNo) {
		
		Connection conn = getConnection();
		
		Reply reply = new AskDao().selectReply(conn, askNo);
		
		close(conn);
		
		return reply;
	}//selectReply

	public int updateReply(int askNo, String newReplyContent) {
		
		Connection conn = getConnection();
		
		int result = new AskDao().updateReply(conn, askNo, newReplyContent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//updateReply
	
	//-----페이징 처리 부분-----
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = new AskDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}//selectListCount
	
	public ArrayList<Ask> selectList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Ask> askList = new AskDao().selectList(conn, pi);
		
		close(conn);
		
		return askList;
	}//selectList
	
	public ArrayList<Ask> selectUserIdList(PageInfo pi, String id){
		
		Connection conn = getConnection();
		
		ArrayList<Ask> list = new AskDao().selectUserIdList(conn, pi, id);
		
		close(conn);
		
		return list;
	}//selectUserIdList
	
	public ArrayList<Reply> selectReplyList(){
		
		Connection conn = getConnection();
		
		ArrayList<Reply> list = new AskDao().selectReplyList(conn);
		
		close(conn);
		
		return list;
	}//selectReplyList
	
	public int updateAskReply(int askNo) {
		
		Connection conn = getConnection();
		
		int result = new AskDao().updateAskReply(conn, askNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}//updateAskReply
	
	public int selectUserIdListCount(int no) {
		
		Connection conn = getConnection();
		
		int result = new AskDao().selectUserIdListCount(conn, no);
		
		close(conn);
		
		return result;
	}//selectUserIdListCount

}
