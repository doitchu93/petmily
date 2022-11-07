package com.kh.adoption.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.adoption.model.dao.AdoptionDao;
import com.kh.adoption.model.vo.Animal;
import com.kh.adoption.model.vo.AnimalInterestList;
import com.kh.adoption.model.vo.Application;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;

public class AdoptionService {

	/**
	 * 보호동물 등록
	 */
	public int insertAnimal(Animal a, ArrayList<Attachment> list) {
		
		Connection conn = getConnection();
		
		int result1 = new AdoptionDao().insertAnimalBoard(conn, a);
		int result2 = new AdoptionDao().insertAttachmentList(conn, list);
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return (result1 * result2);
	}

	/**
	 * 입양게시판메인-총 동물의 수 - 페이징 처리 위함
	 */
	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new AdoptionDao().selectListCount(conn);
		
		close(conn);
		return listCount;
	}

	/**
	 * 페이징처리, 게시글 목록 불러오기
	 */
	public ArrayList<Animal> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Animal> list = new AdoptionDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}

	/**
	 * 동물 상세조회 - 정보
	 */
	public Animal selectAnimal(int animalNo) {
		
		Connection conn = getConnection();
		Animal a = new AdoptionDao().selectAnimal(conn, animalNo);
		close(conn);
		
		return a;
	}

	/**
	 * 동물 상세조회 - 사진
	 */
	public ArrayList<Attachment> selectAttachmentList(int animalNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new AdoptionDao().selectAttachmentList(conn, animalNo);
		close(conn);
		return list;
	}

	/**
	 * 동물 수정
	 */
	public int updateAnimal(Animal a, ArrayList<Attachment> list) {
		Connection conn = getConnection();
		
		int result1 = new AdoptionDao().updateAnimal(conn, a);
		int result2 = 1;
		
		if(!list.isEmpty()) { // 새 첨부파일이 있다면?
			
			int result3 = new AdoptionDao().deleteAttachmentList(conn, a.getAnimalNo()); // 기존 파일 먼저 삭제
			
			int result4 = 1;
			if(result3 > 0) { // 삭제 성공하면 새로운 파일 추가
				result4 = new AdoptionDao().insertNewAttachmentList(conn, list, a.getAnimalNo());
			}
			
			result2 = result3 * result4;
			
		}
		
		if(result1 * result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return (result1*result2);
	}

	/**
	 * 동물 삭제
	 */
	public int deleteAnimal(int animalNo) {
		
		Connection conn = getConnection();
		int result1 = new AdoptionDao().deleteAttachmentList(conn, animalNo);
		int result2 = new AdoptionDao().deleteAnimal(conn, animalNo);
		
		if(result1 * result2 >0){
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return (result1 * result2);
	}

	/**
	 * 관심동물등록
	 */
	public int insertInterestList(AnimalInterestList like) {
		Connection conn = getConnection();
		int result = new AdoptionDao().insertInterestList(conn, like);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	/** 
	 * 관심동물 번호 불러오기
	 */
	public ArrayList<AnimalInterestList> selectAnimalInterestList(int animalNo) {
		Connection conn = getConnection();
		ArrayList<AnimalInterestList> likeList = new AdoptionDao().selectAnimalInterestList(conn, animalNo);
		close(conn);
		
		return likeList;
	}

	/**
	 * 관심등록 해제
	 */
	public int deleteAnimalInterest(AnimalInterestList unlike) {
		Connection conn = getConnection();
		int result = new AdoptionDao().deleteAnimalInterest(conn, unlike);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	/**
	 * 입양신청서 제출
	 */
	public int insertApplication(Application ap) {
		Connection conn = getConnection();
		
		int result = new AdoptionDao().insertApplication(conn, ap);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	/**
	 * 입양신청서 수 - 페이징처리 위함
	 */
	public int selectApplicationListCount() {
		Connection conn = getConnection();
		int listCount = new AdoptionDao().selectApplicationListCount(conn);
		
		close(conn);
		return listCount;
	}

	/**
	 * 입양신청서 게시글 목록
	 */
	public ArrayList<Application> selectApplicationList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Application> list = new AdoptionDao().selectApplicationList(conn, pi);
		
		close(conn);
		
		return list;
	}

	public Application selectApplicationDetail(int apno) {
		Connection conn = getConnection();
		Application a = new AdoptionDao().selectApplicationDetail(conn, apno);
		
		close(conn);
		
		return a;
	}

	/**
	 * 입양신청서 수정(신청상태) - 관리자
	 */
	public int updateApplication(int apno, String status) {
		Connection conn = getConnection();
		int result = new AdoptionDao().updateApplication(conn, apno, status);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
