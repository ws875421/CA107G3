package com.article_published.model;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Article_PublishedJDBCDAO implements Article_PublishedDAO_interface {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "CA107G3";
	String passwd = "123456";

	private static final String INSERT_STMT = "INSERT INTO ARTICLE_PUBLISHED(ART_NO,MEM_NO,ART_TITLE,ART_CONTENT,ART_TIME,ART_PIC1,ART_PIC2,ART_PIC3,ART_PIC4,ART_PIC5,ART_CODE) VALUES('AP'||LPAD(to_char(ARTPUB_SEQ.NEXTVAL),8,'0'),?,?,?,?,?,?,?,?,?,?)";

	private static final String GET_ALL_STMT = "SELECT ART_NO,MEM_NO,ART_TITLE,ART_CONTENT,TO_CHAR(ART_TIME,'yyyy-mm-dd') ART_TIME,ART_CODE FROM ARTICLE_PUBLISHED ORDER BY ART_NO";

	private static final String GET_ONE_STMT = "SELECT ART_NO,MEM_NO,ART_TITLE,ART_CONTENT,TO_CHAR(ART_TIME,'yyyy-mm-dd') ART_TIME,ART_CODE FROM ARTICLE_PUBLISHED WHERE ART_NO=?";

	private static final String DELETE = "DELETE FROM ARTICLE_PUBLISHED WHERE ART_NO=?";

	private static final String UPDATE = "UPDATE ARTICLE_PUBLISHED SET ART_TITLE=?,ART_CONTENT=?,ART_TIME=?,ART_CODE=? WHERE ART_NO=?";

	@Override
	public void insert(Article_PublishedVO article_publishedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(INSERT_STMT);
			pstmt.setString(1, article_publishedVO.getMem_no());
			pstmt.setString(2, article_publishedVO.getArt_title());
			pstmt.setString(3, article_publishedVO.getArt_content());
			pstmt.setDate(4, article_publishedVO.getArt_time());
			byte[] pic1 = getPictureByteArray("C:\\picFrom\\01.jpg");
			pstmt.setBytes(5, pic1);
			byte[] pic2 = getPictureByteArray("C:\\picFrom\\02.jpg");
			pstmt.setBytes(6, pic2);
			byte[] pic3 = getPictureByteArray("C:\\picFrom\\03.jpg");
			pstmt.setBytes(7, pic3);
			byte[] pic4 = getPictureByteArray("C:\\picFrom\\04.jpg");
			pstmt.setBytes(8, pic4);
			byte[] pic5 = getPictureByteArray("C:\\picFrom\\05.jpg");
			pstmt.setBytes(9, pic5);
			pstmt.setInt(10, article_publishedVO.getArt_code());

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver" + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured" + e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}

		}
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}

	@Override
	public void update(Article_PublishedVO article_publishedVO) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(UPDATE);

			pstmt.setString(1, article_publishedVO.getArt_title());
			pstmt.setString(2, article_publishedVO.getArt_content());
			pstmt.setDate(3, article_publishedVO.getArt_time());
			pstmt.setInt(4, article_publishedVO.getArt_code());
			pstmt.setString(5, article_publishedVO.getArt_no());

			pstmt.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver" + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured" + e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(String art_no) {
		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(DELETE);

			pstmt.setString(1, art_no);

			pstmt.executeUpdate();
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver" + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured" + e.getMessage());
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public Article_PublishedVO findByPrimaryKey(String art_no) {
		Article_PublishedVO article_publishedVO = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ONE_STMT);

			pstmt.setString(1, art_no);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				article_publishedVO = new Article_PublishedVO();
				article_publishedVO.setArt_no(rs.getString("ART_NO"));
				article_publishedVO.setMem_no(rs.getString("MEM_NO"));
				article_publishedVO.setArt_title(rs.getString("ART_TITLE"));
				article_publishedVO.setArt_content(rs.getString("ART_CONTENT"));
				article_publishedVO.setArt_time(rs.getDate("ART_TIME"));
				article_publishedVO.setArt_code(rs.getInt("ART_CODE"));
			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return article_publishedVO;
	}

	@Override
	public List<Article_PublishedVO> getAll() {
		List<Article_PublishedVO> list = new ArrayList<Article_PublishedVO>();
		Article_PublishedVO article_publishedVO = null;

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, passwd);
			pstmt = con.prepareStatement(GET_ALL_STMT);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				article_publishedVO = new Article_PublishedVO();
				article_publishedVO.setArt_no(rs.getString("ART_NO"));
				article_publishedVO.setMem_no(rs.getString("MEM_NO"));
				article_publishedVO.setArt_title(rs.getString("ART_TITLE"));
				article_publishedVO.setArt_content(rs.getString("ART_CONTENT"));
				article_publishedVO.setArt_time(rs.getDate("ART_TIME"));
				article_publishedVO.setArt_code(rs.getInt("ART_CODE"));
				list.add(article_publishedVO);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace(System.err);
				}
			}

		}
		return list;

	}

	public static void main(String args[]) {
		Article_PublishedJDBCDAO dao = new Article_PublishedJDBCDAO();

		// 新增
		Article_PublishedVO article_publishedVO1 = new Article_PublishedVO();
		article_publishedVO1.setMem_no("M000006");
		article_publishedVO1.setArt_title("好吃照燒雞腿丼");
		article_publishedVO1.setArt_content("中大山頂丼人賣的照燒雞腿丼吸足了特調湯汁，吃起來又甜又鹹，雞腿肉滑嫩，太好吃了");
		article_publishedVO1.setArt_time(java.sql.Date.valueOf("2017-10-23"));
		article_publishedVO1.setArt_code(1);
		dao.insert(article_publishedVO1);
//		
//		//更新
//		Article_PublishedVO article_publishedVO2 = new Article_PublishedVO();
//		article_publishedVO2.setArt_no("AP00000001");
//		article_publishedVO2.setMem_no("M000005");
//		article_publishedVO2.setArt_title("小叮噹特製的銅鑼燒");
//		article_publishedVO2.setArt_content("小叮噹愛吃銅鑼燒決定自行研發好吃的銅鑼燒，裡面的餡料是由日本黑豆和紅豆攪拌而成，外皮是韓有濃濃乳香的麵皮");
//		article_publishedVO2.setArt_time(java.sql.Date.valueOf("2019-03-23"));
//		article_publishedVO2.setArt_code(2);
//		dao.update(article_publishedVO2);
//		
//		//刪除
//		dao.delete("AP00000007");
//		
//		//查詢其中一個
//		Article_PublishedVO article_publishedVO3 = dao.findByPrimaryKey("AP00000004");
//		System.out.println(article_publishedVO3.getArt_no()+",");
//		System.out.println(article_publishedVO3.getMem_no()+",");
//		System.out.println(article_publishedVO3.getArt_title()+",");
//		System.out.println(article_publishedVO3.getArt_content()+",");
//		System.out.println(article_publishedVO3.getArt_time()+",");
//		System.out.println(article_publishedVO3.getArt_code()+",");
//		System.out.println("---------------------------------");
//		
//		//查詢所有
//		List<Article_PublishedVO> list = dao.getAll();
//		for(Article_PublishedVO article_publishedVO4:list) {
//			System.out.println(article_publishedVO4.getArt_no()+",");
//			System.out.println(article_publishedVO4.getMem_no()+",");
//			System.out.println(article_publishedVO4.getArt_title()+",");
//			System.out.println(article_publishedVO4.getArt_content()+",");
//			System.out.println(article_publishedVO4.getArt_time()+",");
//			System.out.println(article_publishedVO4.getArt_code()+",");
//			System.out.println();
//		}
	}

}
