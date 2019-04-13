package com.member.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberJNDIDAO implements MemberDAO_interface {

	public MemberJNDIDAO() {
	}

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/CA107G3");
		} catch (NamingException e) {

			e.printStackTrace();
		}
	}

	private static final String INSERT_STMT = "INSERT INTO MEMBER VALUES ('M'||LPAD(to_char(member_seq.NEXTVAL), 6, '0'),?,?,?,?,?,?,?,?,NULL,?,?)";
	private static final String UPDATE = "UPDATE MEMBER SET MEM_NAME = ?, MEM_PWD = ?, MEM_GENDER = ?, MEM_TEL = ?, MEM_STATUS = ?,MEM_PIC = ? , MEM_BALANCE = ?, MEM_NICKNAME = ? WHERE MEM_ACCOUNT = ?";
	private static final String DELETE = "DELETE FROM MEMBER WHERE MEM_NO =?";
	private static final String GET_ONE_STMT = "SELECT * FROM MEMBER WHERE MEM_NO = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM MEMBER ";

	@Override
	public int insert(MemberVo memberVO) {
		Connection con = null;
		PreparedStatement pstm = null;
		int rs = 0;

		try {
			con = ds.getConnection();
			System.out.println("連線成功!");
			pstm = con.prepareStatement(INSERT_STMT);
			pstm.setString(1, memberVO.getMem_name());
			pstm.setString(2, memberVO.getMem_account());
			pstm.setString(3, memberVO.getMem_pwd());
			pstm.setString(4, memberVO.getMem_gender());
			pstm.setString(5, memberVO.getMem_mail());
			pstm.setString(6, memberVO.getMem_id());
			pstm.setString(7, memberVO.getMem_tel());
			pstm.setString(8, memberVO.getMem_status());
			pstm.setDouble(9, memberVO.getMem_balance());
			pstm.setString(10, memberVO.getMem_nickname());

			rs = pstm.executeUpdate();
			System.out.println("成功筆數 : " + rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return rs;
	}

	@Override
	public int update(MemberVo memberVO) {
		Connection con = null;
		PreparedStatement pstm = null;
		int rs = 0;

		try {
			con =  ds.getConnection();
			pstm = con.prepareStatement(UPDATE);
			pstm.setString(1, memberVO.getMem_name());
			pstm.setString(2, memberVO.getMem_pwd());
			pstm.setString(3, memberVO.getMem_gender());
			pstm.setString(4, memberVO.getMem_tel());
			pstm.setString(5, memberVO.getMem_status());
			pstm.setDouble(6, memberVO.getMem_balance());
			pstm.setString(7, memberVO.getMem_nickname());
			pstm.setString(8, memberVO.getMem_account());

			rs = pstm.executeUpdate();

			System.out.println("更新筆數 : " + rs);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return rs;
	}

	@Override
	public int delete(String mem_no) {

		Connection con = null;
		PreparedStatement pstm = null;
		int rs = 0;

		try {
			con =  ds.getConnection();
			pstm = con.prepareStatement(DELETE);
			pstm.setString(1, mem_no);
			rs = pstm.executeUpdate();

			System.out.println("更新筆數 : " + rs);

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return rs;

	}

	@Override
	public MemberVo findByPrimaryKey(String mem_no) {

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberVo member = null;

		try {
			con =  ds.getConnection();
			pstm = con.prepareStatement(GET_ONE_STMT);
			pstm.setString(1, mem_no);
			rs = pstm.executeQuery();

			while (rs.next()) {
				member = new MemberVo();
				member.setMem_no(mem_no);
				member.setMem_name(rs.getString(2));
				member.setMem_account(rs.getString(3));
				member.setMem_pwd(rs.getString(4));
				member.setMem_gender(rs.getString(5));
				member.setMem_mail(rs.getString(6));
				member.setMem_id(rs.getString(7));
				member.setMem_tel(rs.getString(8));
				member.setMem_status(rs.getString(9));
				// member.setMem_pic();
				member.setMem_balance(rs.getDouble(11));
				member.setMem_nickname(rs.getString(12));
			}
			System.out.println("查詢完畢");

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return member;
	}

	@Override
	public List<MemberVo> getAll() {
		List<MemberVo> mlist = new ArrayList<>();
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		MemberVo member = null;

		try {
			con =  ds.getConnection();
			pstm = con.prepareStatement(GET_ALL_STMT);
			rs = pstm.executeQuery();

			while (rs.next()) {
				member = new MemberVo();
				member.setMem_no(rs.getString(1));
				member.setMem_name(rs.getString(2));
				member.setMem_account(rs.getString(3));
				member.setMem_pwd(rs.getString(4));
				member.setMem_gender(rs.getString(5));
				member.setMem_mail(rs.getString(6));
				member.setMem_id(rs.getString(7));
				member.setMem_tel(rs.getString(8));
				member.setMem_status(rs.getString(9));
				member.setMem_balance(rs.getDouble(11));
				member.setMem_nickname(rs.getString(12));
				// 裝入集合
				mlist.add(member);
			}
			System.out.println("查詢完畢");

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return mlist;
	}

}
