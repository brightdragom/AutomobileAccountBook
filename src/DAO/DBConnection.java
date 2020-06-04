package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DBConnection {
	private Connection conn; // connection:db�뿉�젒洹쇳븯寃� �빐二쇰뒗 媛앹껜

	private PreparedStatement pstmt;

	private ResultSet rs;

	public DBConnection() {
		try {

			String dbURL = "jdbc:mysql://localhost:3306/demoweb?serverTimezone=UTC"; // localhost:3306 �룷�듃�뒗 而댄벂�꽣�꽕移섎맂 mysql二쇱냼

			String dbID = "root";

			String dbPassword = "5623";

			Class.forName("com.mysql.cj.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // �삤瑜섍� 臾댁뾿�씤吏� 異쒕젰

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
					System.out.println("�븘�씠�뵒 o 鍮꾨쾲 x");
					return false;
				}
			}
			System.out.println("�븘�씠�뵒 x");
			return false;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return false;
	}
}
