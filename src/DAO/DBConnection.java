package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	private Connection conn; // connection:db에접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs;

	public DBConnection() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/dbname?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된 mysql주소

			String dbID = "id";

			String dbPassword = "password";

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
}
