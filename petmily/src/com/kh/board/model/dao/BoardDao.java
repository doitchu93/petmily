package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.adoption.model.vo.Animal;
import com.kh.board.model.vo.Board;
//import com.kh.product.model.vo.Product;

public class BoardDao {
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		
		String file = BoardDao.class.getResource("/sql/board/board-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	public ArrayList<Animal> selectInterListAN(Connection conn, int userNo) {
		
		ArrayList<Animal> listAN = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectInterListAN");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				listAN.add(new Animal(rset.getInt("ANIMAL_NO"),
								      rset.getString("CATEGORY_NAME"),
								      rset.getString("ANIMAL_NAME"),
								      rset.getString("GENDER"),
								      rset.getString("NEUTRALIZATION"),
								      rset.getInt("ANIMAL_AGE"),
								      rset.getDouble("ANIMAL_WEIGHT")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return listAN;
		
		
		
		
	}

//	public ArrayList<Product> selectInterListPR(Connection conn, int userNo) {
//		
//		ArrayList<Product> listPR = new ArrayList();
//		
//		PreparedStatement pstmt = null;
//		ResultSet rset = null;
//		
//		String sql = prop.getProperty("selectInterListPR");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, userNo);
//			
//			rset = pstmt.executeQuery();
//			
//			while(rset.next()) {
//				
//				listPR.add(new Product(rset.getInt("PRODUCT_NO"),
//									   rset.getString("PRODUCT_NAME"),
//									   rset.getInt("PRICE"),
//									   rset.getString("CATEGORY_NAME")));
//				
//				
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rset);
//			close(pstmt);
//		}
//		
//		return listPR;
//		
//	}

	public ArrayList<Board> selectAdoptComment(Connection conn, int userNo) {
		
		ArrayList<Board> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAdoptComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Board(rset.getInt("COM_NO"),
								   rset.getInt("USER_NO"),
								   rset.getInt("COUNT"),
								   rset.getDate("CREATE_DATE"),
								   rset.getString("COM_TITLE")));
				
				
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
		
		
		
		
		
		
		
		
		
		
	}

	public ArrayList<Board> selectVolunteerComment(Connection conn, int userNo) {

		ArrayList<Board> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectVolunteerComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Board(rset.getInt("COM_NO"),
								   rset.getInt("USER_NO"),
								   rset.getInt("COUNT"),
								   rset.getDate("CREATE_DATE"),
								   rset.getString("COM_TITLE")));
				
				
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
	}

	public ArrayList<Board> selectVolunteerRecruit(Connection conn, int userNo) {

		ArrayList<Board> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectVolunteerRecruit");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Board(rset.getInt("COM_NO"),
								   rset.getInt("USER_NO"),
								   rset.getInt("COUNT"),
								   rset.getDate("CREATE_DATE"),
								   rset.getString("COM_TITLE")));
				
				
			}
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}

	public ArrayList<Animal> selectAnimalPost(Connection conn, int userNo) {

		ArrayList<Animal> list = new ArrayList();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnimalPost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Animal(rset.getInt("ANIMAL_NO"),
								      rset.getString("CATEGORY_NAME"),
								      rset.getString("ANIMAL_NAME"),
								      rset.getString("GENDER"),
								      rset.getString("NEUTRALIZATION"),
								      rset.getInt("ANIMAL_AGE"),
								      rset.getDouble("ANIMAL_WEIGHT")));
				
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
