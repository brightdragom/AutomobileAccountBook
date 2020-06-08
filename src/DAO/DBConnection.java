package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.HousekeepingBook;

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
			System.out.println(" >>> SQL : "+ SQL +"<<<");
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<HousekeepingBook> getHousekeepingList(String id) {
		String SQL = "select * from hb_book where writer = ?";
		
		ArrayList<HousekeepingBook> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, id);
			System.out.println(" >>> id : "+ id +"<<<");
			System.out.println(" >>> SQL : "+ SQL +"<<<");
			rs = pstmt.executeQuery();
			HousekeepingBook item = null;
			
			while(rs.next()) {
				item = new HousekeepingBook(rs.getString("line_no"), rs.getString("todate"), 
						rs.getString("content"), rs.getInt("cost"), rs.getInt("mileage"), rs.getString("writer"));
				list.add(item);
				
				System.out.println("생성 >>> "+item.getLine_no()+"|"+item.getContent());
			}
			System.out.println("list size = "+ list.size() + "\t");
			return list;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return list;
	}
}
