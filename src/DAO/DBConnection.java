package DAO;

import java.sql.Connection;
import model.*;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnection {
	private Connection conn; // connection:db에접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;

	public DBConnection() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/dbname?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "root";

			String dbPassword = "0000";

			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // 오류가 무엇인지 출력

		}

	}
	
	
	public boolean login(String id, String pw) {
		
		String SQL = "SELECT * FROM login where id = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("pw").equals(pw)) {
					return true;
				}else{
					System.out.println("아이디 o 비번 x");
					return false;
				}
			}
			System.out.println("아이디 x");
			return false;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return false;
	}
	
	public int register (String id, String pw, String phone, String email, String part, String addr, String name) {
		pstmt = null;
		ResultSet re = null;
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, part);
			pstmt.setString(6, addr);
			pstmt.setString(7, name);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //오류
	}
	
	public String findId(String name, String phone) {
		
		boolean findSuccess = false;
		String id = null;
		String SQL = "select * from user where name='" + "?" + "' and phone='" + "?'" ;
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
	
	public String findPw(String id, String phone){
		
		boolean findSuccess = false;
		String pw = null;
		String SQL = "select * from user where id='" + "?" + "' and phone='" + "?'" ;
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
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
			return pw;
		else
			return null;
	}
	
	public int registerCheck (String id) {
		pstmt = null;
		ResultSet re = null;
		String SQL = "SELECT * FROM USER WHERE id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			re = pstmt.executeQuery();
			if (rs.next()) {
				return 0;
			}
			else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return -1; //오류
	}
	
}
