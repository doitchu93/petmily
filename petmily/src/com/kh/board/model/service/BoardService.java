package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.adoption.model.vo.Animal;
import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.vo.Board;
//import com.kh.product.model.vo.Product;

public class BoardService {
	
	public ArrayList<Animal> selectInterListAN(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Animal> listAN = new BoardDao().selectInterListAN(conn, userNo);
		
		close(conn);
		
		return listAN;
		
		
	}
	
//	public ArrayList<Product> selectInterListPR(int userNo) {
//		
//		Connection conn = getConnection();
//		
//		ArrayList<Product> listPR = new BoardDao().selectInterListPR(conn, userNo);
//		
//		close(conn);
//		
//		return listPR;
//		
//		
//	}
	
	public ArrayList<Board> selectAdoptComment(int userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectAdoptComment(conn, userNo);
		
		close(conn);
		
		return list;
		
	}

	public ArrayList<Board> selectVolunteerComment(int userNo) {

		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectVolunteerComment(conn, userNo);
		
		close(conn);
		
		return list;
		
	}

	public ArrayList<Board> selectVolunteerRecruit(int userNo) {

		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectVolunteerRecruit(conn, userNo);
		
		close(conn);
		
		return list;
		
		
	}

	public ArrayList<Animal> selectAnimalPost(int userNo) {

		Connection conn = getConnection();
		
		ArrayList<Animal> list = new BoardDao().selectAnimalPost(conn, userNo);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	
	
	

}
