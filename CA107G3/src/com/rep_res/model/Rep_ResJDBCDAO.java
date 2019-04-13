package com.rep_res.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class Rep_ResJDBCDAO implements Rep_ResDAO_interface {

	final static String DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String URL = "jdbc:oracle:thin:@localhost:1521:XE";
	final static String USER = "CA107G3";
	final static String PASSWORD = "123456";

	// SQL
	private static final String INSERT_STMT = "INSERT INTO REP_RES VALUES ('RR'||LPAD(to_char(REP_RES_SEQ.NEXTVAL), 8, '0'),?,?,?,?,?)";
	private static final String UPDATE = "UPDATE REP_RES SET REP_RES_STATUS = ? WHERE REP_RES_NO = ?";
	private static final String DELETE = "DELETE FROM REP_RES WHERE REP_RES_NO =?";
	private static final String GET_ONE_STMT = "SELECT * FROM REP_RES WHERE REP_RES_NO = ?";
	private static final String GET_ALL_STMT = "SELECT * FROM REP_RES ";

	static {
		try {
			Class.forName(DRIVER);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public Rep_ResJDBCDAO() {
	}

	@Override
	public int insert(Rep_ResVo rep_ResVo) {
		Connection con = null;
		PreparedStatement pstm = null;
		int rs = 0;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstm = con.prepareStatement(INSERT_STMT);
			pstm.setString(1, rep_ResVo.getMem_no());
			pstm.setString(2, rep_ResVo.getVendor_no());
			pstm.setString(3, rep_ResVo.getRep_res_detl());
			pstm.setTimestamp(4, rep_ResVo.getRep_res_time());
			pstm.setString(5, rep_ResVo.getRep_res_status());

			rs = pstm.executeUpdate();

			System.out.println("更新筆數 : " + rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public int update(Rep_ResVo rep_ResVo) {
		Connection con = null;
		PreparedStatement pstm = null;
		int rs = 0;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstm = con.prepareStatement(UPDATE);
			pstm.setString(1, rep_ResVo.getRep_res_status());
			pstm.setString(2, rep_ResVo.getRep_res_no());

			rs = pstm.executeUpdate();

			System.out.println("更新筆數 : " + rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public int delete(String rep_res_no) {
		Connection con = null;
		PreparedStatement pstm = null;
		int rs = 0;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstm = con.prepareStatement(DELETE);
			pstm.setString(1, rep_res_no);
			rs = pstm.executeUpdate();

			System.out.println("更新筆數 : " + rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rs;
	}

	@Override
	public Rep_ResVo findByPrimaryKey(String rep_res_no) {

		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Rep_ResVo rep_resVo = null;

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstm = con.prepareStatement(GET_ONE_STMT);
			pstm.setString(1, rep_res_no);
			rs = pstm.executeQuery();

			while (rs.next()) {
				rep_resVo = new Rep_ResVo();
				rep_resVo.setRep_res_no(rep_res_no);
				rep_resVo.setMem_no(rs.getString(2));
				rep_resVo.setVendor_no(rs.getString(3));
				rep_resVo.setRep_res_detl(rs.getString(4));
				rep_resVo.setRep_res_time(rs.getTimestamp(5));
				rep_resVo.setRep_res_status(rs.getString(6));

			}
			System.out.println("查詢完畢");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return rep_resVo;
	}

	@Override
	public List<Rep_ResVo> getAll() {
		Connection con = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Rep_ResVo rep_resVo = null;
		List<Rep_ResVo> replist = new ArrayList<>();

		try {
			con = DriverManager.getConnection(URL, USER, PASSWORD);
			pstm = con.prepareStatement(GET_ALL_STMT);

			rs = pstm.executeQuery();

			while (rs.next()) {
				rep_resVo = new Rep_ResVo();
				rep_resVo.setRep_res_no(rs.getString(1));
				rep_resVo.setMem_no(rs.getString(2));
				rep_resVo.setVendor_no(rs.getString(3));
				rep_resVo.setRep_res_detl(rs.getString(4));
				rep_resVo.setRep_res_time(rs.getTimestamp(5));
				rep_resVo.setRep_res_status(rs.getString(6));
				replist.add(rep_resVo);
			}
			System.out.println("查詢完畢");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return replist;
	}

	public static void main(String[] args) {

		Rep_ResDAO_interface repDAO = new Rep_ResJDBCDAO();

		// 單筆查詢
		// System.out.println(repDAO.findByPrimaryKey("RR00000001"));

		// 多筆查詢
		// List<Rep_ResVo> replist = repDAO.getAll();
		// for (Rep_ResVo r : replist) {
		// System.out.println(r);
		// }

		// repDAO.delete("RR00000006");

		// 更新狀態
		// Rep_ResVo r1 = new Rep_ResVo("RR00000007", "1");
		// repDAO.update(r1);

		// 插入資料

		// long l = System.currentTimeMillis();
		//// java.sql.Date date = new java.sql.Date(l);
		// Timestamp date2 = new Timestamp(l);
		// Rep_ResVo r2 = new Rep_ResVo("M000005", "V000005", "我是來亂的", date2, "3");
		// repDAO.insert(r2);

	}
}
