package DAO;

import java.sql.Connection;
import model.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.AutoAccountList;
import java.sql.SQLException;

public class DBConnection {
	private Connection conn; // connection:db�뿉�젒洹쇳븯寃� �빐二쇰뒗 媛앹껜

	private PreparedStatement pstmt;

	private ResultSet rs;

	public DBConnection() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/accountBook?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된

			String dbID = "root";

			String dbPassword = "1234";

			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // �삤瑜섍� 臾댁뾿�씤吏� 異쒕젰

		}

	}

	public User login(String id, String pw) {

		String SQL = "SELECT * FROM user where id = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			System.out.println(" >>> SQL : " + SQL + "<<<");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (rs.getString("pw").equals(pw)) {
					return new User(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
							rs.getString(6), rs.getString(7), rs.getString(8));
				} else {
					System.out.println("Password erro");
					return null;
				}
			}
			System.out.println("�븘�씠�뵒 x");
			return null;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return null;
	}

	public AutoAccountList findLine(String line_no) {

		String SQL = "SELECT * FROM list where line_no = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, line_no);
			System.out.println(" >>> SQL : " + SQL + "<<<");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return new AutoAccountList(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getInt(5), rs.getString(6));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return null;
	}

	// 수정할곳 -gy
	public AutoAccountList Edit_line(String line_no) {

		String SQL = "SELECT * FROM list where line_no = ?";

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, line_no);
			System.out.println(" >>> SQL : " + SQL + "<<<");
			rs = pstmt.executeQuery();

			if (rs.next()) {
				return new AutoAccountList(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4),
						rs.getInt(5), rs.getString(6));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return null;
	}

	public List<AutoAccountList> getHousekeepingList(String id) {
		String SQL = "select * from list where writer = ?";

		ArrayList<AutoAccountList> list = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			System.out.println(" >>> id : " + id + "<<<");
			System.out.println(" >>> SQL : " + SQL + "<<<");
			rs = pstmt.executeQuery();

			AutoAccountList item = null;

			while (rs.next()) {
				item = new AutoAccountList(rs.getString("line_no"), rs.getString("todate"), rs.getString("content"),
						rs.getInt("cost"), rs.getInt("mileage"), rs.getString("writer"));
				list.add(item);

				System.out.println("생성 >>> " + item.getLine_no() + "|" + item.getContent());
			}
			System.out.println("list size = " + list.size() + "\t");
			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return list;
	}

	public int register (String id, String pw, String phone, String email, String part, String addr, String name, String gender) {

		pstmt = null;
		ResultSet re = null;
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, part);
			pstmt.setString(6, addr);
			pstmt.setString(7, name);
			pstmt.setString(7, gender);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 오류
	}

	public String findId(String name, String phone) {

		boolean findSuccess = false;
		String id = null;
		String SQL = "select id from user where name= ? and phone = ?" ;

		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				String id_db = rs.getString("id");
				id = rs.getString(1);
				findSuccess = (id != null) ? true : false;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		if (findSuccess)
			return id;
		else
			return null;
	}

	public String findPw(String id, String phone) {

		boolean findSuccess = false;
		String pw = null;
		String SQL = "select * from user where id='" + "?" + "' and phone='" + "?'";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, phone);
			rs = pstmt.executeQuery();

			while (rs.next()) {

				String pw_db = rs.getString("pw");
				pw = rs.getString(1);
				findSuccess = (pw != null) ? true : false;
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}

		if (findSuccess)
			return pw;
		else
			return null;
	}

	public int registerCheck(String id) {
		pstmt = null;
		ResultSet re = null;
		String SQL = "SELECT * FROM USER WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			re = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			} else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 오류
	}

	public String getDate() {

		String SQL = "SELECT NOW()"; // 현재 시간 가져오기

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getString(1);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return "";

	}

	public int getNext() {

		String SQL = "SELECT repaircheck_no FROM repaircheck ORDER BY repaircheck_no DESC";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				return rs.getInt(1) + 1;

			}

			return 1;// 첫 번째 게시물인 경우

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1;

	}

	public int write(String Title, String Content) {

		String SQL = "INSERT INTO repaircheck VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {

			PreparedStatement pstmt = conn.prepareStatement(SQL);

			pstmt.setInt(1, getNext());

			pstmt.setInt(2, getNext());

			pstmt.setInt(3, getNext());

			pstmt.setInt(4, getNext());

			pstmt.setInt(5, getNext());

			pstmt.setString(6, Title);

			pstmt.setString(7, Content);

			pstmt.setInt(8, getNext());

			pstmt.setInt(9, getNext());

			pstmt.setString(10, getDate());

			pstmt.setInt(11, getNext());

			return pstmt.executeUpdate();

		} catch (Exception e) {

			e.printStackTrace();

		}

		return -1; // 데이터베이스 오류

	}

}
