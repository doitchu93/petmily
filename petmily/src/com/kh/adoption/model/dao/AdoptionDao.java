package com.kh.adoption.model.dao;

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
import com.kh.adoption.model.vo.AnimalInterestList;
import com.kh.adoption.model.vo.Application;
import com.kh.common.model.vo.Attachment;
import com.kh.common.model.vo.PageInfo;

public class AdoptionDao {

	private Properties prop = new Properties();

	public AdoptionDao() {
		String file = AdoptionDao.class.getResource("/sql/adoption/adoption-mapper.xml").getPath();
	
		try {
		prop.loadFromXML(new FileInputStream(file));
		} catch (IOException e) {
		e.printStackTrace();
		}
	}
	
	/**
	 * 보호동물 등록 -- 동물 정보 등록
	 */
	public int insertAnimalBoard(Connection conn, Animal a) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAnimalBoard");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(a.getCategoryNo()));
			pstmt.setString(2, a.getAnimalName());
			pstmt.setString(3, a.getGender());
			pstmt.setString(4, a.getNeutralization());
			pstmt.setInt(5, a.getAnimalAge());
			pstmt.setDouble(6, a.getWeight());
			pstmt.setInt(7, a.getFriendly());
			pstmt.setInt(8, a.getActive());
			pstmt.setString(9, a.getDescription());
			pstmt.setInt(10, a.getUserNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	/**
	 * 보호동물 등록 -- 사진 등록
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
					pstmt.setString(5, "AN"); // 동물 게시판타입
					
					result *= pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		return result;
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnimalListCount");
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
	}

	public ArrayList<Animal> selectList(Connection conn, PageInfo pi) {
		ArrayList<Animal> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAnimalList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Animal(
									rset.getInt("ANIMAL_NO"),
									rset.getString("CATEGORY_NAME"),
									rset.getString("ANIMAL_NAME"),
									rset.getString("GENDER"),
									rset.getString("NEUTRALIZATION"),
									rset.getInt("ANIMAL_AGE"),
									rset.getDouble("ANIMAL_WEIGHT"),
									rset.getString("ADOPTED"),
									rset.getString("TITLEIMG")));												
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public Animal selectAnimal(Connection conn, int animalNo) {
		
		Animal a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAnimal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, animalNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				a = new Animal(
								rset.getInt("ANIMAL_NO"),
								rset.getString("CATEGORY_NAME"),
								rset.getString("ANIMAL_NAME"),
								rset.getString("GENDER"),
								rset.getString("NEUTRALIZATION"),
								rset.getInt("ANIMAL_AGE"),
								rset.getDouble("ANIMAL_WEIGHT"),
								rset.getInt("FRIENDLY"),
								rset.getInt("ACTIVE"),
								rset.getString("ADOPTED"),
								rset.getString("ANIMAL_DESC"),
								rset.getInt("USER_NO")
								
								);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return a;
	}

	public ArrayList<Attachment> selectAttachmentList(Connection conn, int animalNo) {
		
		ArrayList<Attachment> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, animalNo);
			pstmt.setString(2, "AN"); // 동물게시판타입
			
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

	public int updateAnimal(Connection conn, Animal a) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateAnimal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(a.getCategoryNo()));
			pstmt.setString(2, a.getAnimalName());
			pstmt.setString(3, a.getGender());
			pstmt.setString(4, a.getNeutralization());
			pstmt.setInt(5, a.getAnimalAge());
			pstmt.setDouble(6, a.getWeight());
			pstmt.setInt(7, a.getFriendly());
			pstmt.setInt(8, a.getActive());
			pstmt.setString(9, a.getAdopted());
			pstmt.setString(10, a.getDescription());
			pstmt.setInt(11, a.getAnimalNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteAttachmentList(Connection conn, int animalNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAttachmentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, animalNo);
			pstmt.setString(2, "AN");
			
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertNewAttachmentList(Connection conn, ArrayList<Attachment> list, int animalNo) {
		int result = 1;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachmentList");
		
			try {
				for(Attachment at : list) {
					pstmt = conn.prepareStatement(sql);
					pstmt.setInt(1, animalNo);
					pstmt.setString(2, at.getOriginName());
					pstmt.setString(3, at.getChangeName());
					pstmt.setString(4, at.getFilePath());
					pstmt.setInt(5, at.getFileLevel());
					pstmt.setString(6, "AN"); // 동물 게시판타입					

					
					result *= pstmt.executeUpdate();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
		return result;
	}

	public int deleteAnimal(Connection conn, int animalNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteAnimal");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, animalNo);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertInterestList(Connection conn, AnimalInterestList like) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertInterestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, like.getUserNo());
			pstmt.setInt(2, like.getAnimalNo());
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		return result;
	}

	public ArrayList<AnimalInterestList> selectAnimalInterestList(Connection conn, int animalNo) {
		
		ArrayList<AnimalInterestList> likeList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectAnimalInterestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, animalNo);
			
			rset = pstmt.executeQuery();
			while(rset.next()) {
				AnimalInterestList like = new AnimalInterestList(rset.getInt("USER_NO"));
				likeList.add(like);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return likeList;
	}

	public int deleteAnimalInterest(Connection conn, AnimalInterestList unlike) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteInterestList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, unlike.getUserNo());
			pstmt.setInt(2, unlike.getAnimalNo());
			
			result = pstmt.executeUpdate();
						
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}	
		return result;
	}

	public int insertApplication(Connection conn, Application ap) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertApplication");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ap.getAgreement());
			pstmt.setString(2, ap.getName());
			pstmt.setString(3, ap.getPhone());
			pstmt.setString(4, ap.getSubPhone());
			pstmt.setString(5, ap.getEmail());
			pstmt.setString(6, ap.getGender());
			pstmt.setInt(7, ap.getAge());
			pstmt.setString(8, ap.getAddress());
			pstmt.setString(9, ap.getSns());
			pstmt.setString(10, ap.getJob());
			pstmt.setString(11, ap.getMaritalStatus());
			pstmt.setInt(12, ap.getAnimalNo());
			pstmt.setString(13, ap.getAnimalName());
			pstmt.setString(14, ap.getQ2());
			pstmt.setString(15, ap.getQ3());			
			pstmt.setString(16, ap.getQ4());
			pstmt.setString(17, ap.getQ5());
			pstmt.setString(18, ap.getQ6());
			pstmt.setString(19, ap.getQ7());
			pstmt.setString(20, ap.getQ8());
			pstmt.setString(21, ap.getQ9());
			pstmt.setString(22, ap.getQ10());
			pstmt.setString(23, ap.getQ11());
			pstmt.setString(24, ap.getQ12());
			pstmt.setString(25, ap.getQ13());
			pstmt.setString(26, ap.getQ14());
			pstmt.setString(27, ap.getQ15());
			pstmt.setString(28, ap.getQ16());
			pstmt.setString(29, ap.getQ17());
			pstmt.setString(30, ap.getQ18());
			pstmt.setString(31, ap.getQ19());
			pstmt.setString(32, ap.getQ20());

			pstmt.setInt(33, ap.getCategoryNo());
			
			result = pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int selectApplicationListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectApplicationListCount");
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
		
	}

	public ArrayList<Application> selectApplicationList(Connection conn, PageInfo pi) {
		ArrayList<Application> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectApplicationList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Application(rset.getInt("APPLICATION_NO"),
										 rset.getDate("APPLICATION_DATE"),
										 rset.getString("APPLICANT_NAME"),
										 rset.getString("PHONE"),
										 rset.getInt("ANIMAL_NO"),
										 rset.getString("ANIMAL_NAME"),
										 rset.getString("STATUS"),
										 rset.getInt("CATEGORY_NO"),
										 rset.getString("CATEGORY_NAME")
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

	public Application selectApplicationDetail(Connection conn, int apno) {
		Application a = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectApplicationDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, apno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {				
				a = new Application(
									rset.getInt("APPLICATION_NO"),
									rset.getDate("APPLICATION_DATE"),
									rset.getString("AGREEMENT"),
									rset.getString("APPLICANT_NAME"),
									rset.getString("PHONE"),
									rset.getString("SUB_PHONE"),
									rset.getString("EMAIL"),
									rset.getString("GENDER"),
									rset.getInt("AGE"),
									rset.getString("ADDRESS"),
									rset.getString("SNS"),
									rset.getString("JOB"),
									rset.getString("MARITAL_STATUS"),
									rset.getInt("ANIMAL_NO"),
									rset.getString("ANIMAL_NAME"),
									rset.getString("Q2"),
									rset.getString("Q3"),
									rset.getString("Q4"),
									rset.getString("Q5"),
									rset.getString("Q6"),
									rset.getString("Q7"),
									rset.getString("Q8"),
									rset.getString("Q9"),
									rset.getString("Q10"),
									rset.getString("Q11"),
									rset.getString("Q12"),
									rset.getString("Q13"),
									rset.getString("Q14"),
									rset.getString("Q15"),
									rset.getString("Q16"),
									rset.getString("Q17"),
									rset.getString("Q18"),
									rset.getString("Q19"),
									rset.getString("Q20"),
									rset.getString("status"),
									rset.getInt("CATEGORY_NO")
									);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return a;
	}

	public int updateApplication(Connection conn, int apno, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateApplication");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, status);
			pstmt.setInt(2, apno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
