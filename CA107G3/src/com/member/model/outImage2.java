package com.member.model;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

/**
 * 資料庫顯示圖片
 */
//@WebServlet("/outImage")

public class outImage2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static DataSource ds = null;
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	InputStream in = null;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		System.out.println("doGet");
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost");
		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();

		try {
			Statement stmt = con.createStatement();


			String s = req.getParameter("mem_no");
//			String s2 =s.substring(1, 7);
//			System.out.println(s.substring(1, 7));
//			int no = Integer.parseInt(s.substring(1, 7));
//			System.out.println(no);
			
//						SELECT MEM_PIC FROM MEMBER WHERE mem_no = 'M000001'
			
			String SQL = "SELECT MEM_PIC FROM MEMBER WHERE mem_no = '"+s+"'";
			System.out.println(SQL);
			ResultSet rs = stmt.executeQuery(SQL);

			if (rs.next()) {
				BufferedInputStream in = new BufferedInputStream(rs.getBinaryStream("MEM_PIC"));
				byte[] buf = new byte[4 * 1024]; // 4K buffer
				int len;
				while ((len = in.read(buf)) != -1) {
					out.write(buf, 0, len);
				}
			} else {
				res.sendError(HttpServletResponse.SC_NOT_FOUND);
				// 查詢指令錯誤 404的時候
				InputStream in = getServletContext().getResourceAsStream("/NoData/no.png");
				byte[] b = new byte[in.available()];
				in.read(b);
				out.write(b);
			}

			rs.close();
			stmt.close();
		} catch (Exception e) {
			// 查詢指令錯誤 404的時候
			// null Exception 的時候
			System.out.println("找不到圖片");
			in = getServletContext().getResourceAsStream("/NoData/null.png");
			byte[] b = new byte[in.available()];
			in.read(b);
			out.write(b);
			in.close();
		} finally {
			if (out != null) {
				out.close();
			}

			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}

			if (in != null) {
				in.close();
			}

//			if (con!= null) {
//				try {
//					con.close();
//				} catch (SQLException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}

		}

	}

	public void init() throws ServletException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "CA107G3", "123456");
//		
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CA107G3");
//			con = ds.getConnection();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void destroy() {
		try {
			if (con != null)
				con.close();
		} catch (SQLException e) {
			System.out.println(e);
		}

	}

	public static void main(String[] args) {
					
		String s = "M000001";
		System.out.println(s.substring(1, 7));

	}
}
