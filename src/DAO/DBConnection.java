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

			String dbURL = "jdbc:mysql://localhost:3306/user?serverTimezone=UTC"; // localhost:3306 포트는 컴퓨터설치된
			
			String dbID = "root";

			String dbPassword = "0000";


			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);

		} catch (Exception e) {

			e.printStackTrace(); // �삤瑜섍� 臾댁뾿�씤吏� 異쒕젰

		}

	}

	public User login(String id, String pw) {	//로그인 메소드

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

	public boolean editLine(AutoAccountList aac) {	//가계부 라인 수정 메소드

		String SQL = "UPDATE list SET todate = ?, contents = ?, cost = ?, mileage = ? where line_no = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, aac.getTodate());
			pstmt.setString(2, aac.getContent());
			pstmt.setInt(3, aac.getCost());
			pstmt.setInt(4, aac.getMileage());
			pstmt.setString(5, aac.getLine_no());
			System.out.println("Edit SQL >>>> "+SQL);
			System.out.println(aac.getTodate()+"\t"+aac.getContent()+"\t"+aac.getCost()+"\t"+aac.getMileage()+"\t line_no> "+aac.getLine_no());
			int result = pstmt.executeUpdate();
			
			if(result != 0) {
				return true;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("db err");
		return false;
	}

	public AutoAccountList findLine(String line_no) {	//차계부 라인 찾는 메소드

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
	
	public List<AutoAccountList> getHousekeepingList(String id) {	//차계부 아이디에 맞게 내용 가져오는 메소드
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
				item = new AutoAccountList(rs.getString("line_no"), rs.getString("todate"), rs.getString("contents"),
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

	public int register (String name, String id, String pw, String phone, String email, String part, String addr, String gender) {

		pstmt = null;
		ResultSet re = null;
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, pw);
			pstmt.setString(4, phone);
			pstmt.setString(5, email);
			pstmt.setString(6, part);
			pstmt.setString(7, addr);
			pstmt.setString(8, gender);
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
		String SQL = "select pw from user where id= ? and phone = ?";
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
			if (re.next() || id.equals("")) {
				return 0;
			} else {
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (re != null)
					re.close();
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

	public boolean Add_line(User user, AutoAccountList aal) {
		int num = 0;
		String SQL = "INSERT INTO list VALUES(?,?,?,?,?,?)";
		String SQL2 = "Select MAX(line_no) from list";
		try {
			pstmt = conn.prepareStatement(SQL2);
			System.out.println(" >>> SQL : " + SQL2 + "<<<");
			rs = pstmt.executeQuery();
			
			String result = null;
			//rs.getString("MAX(line_no)");
			/*System.out.println(result);
			int line_no = 0;
			if(result != null) {
				line_no = Integer.parseInt(result);
			}*/
			int line_no = 0;
			
			if(rs.next()) {
				line_no = rs.getInt(1);
			}
			System.out.println("Max(line_no) : "+line_no++);
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, line_no);
			pstmt.setString(2, aal.getTodate());
			pstmt.setString(3, aal.getContent());
			pstmt.setInt(4, aal.getCost());
			pstmt.setInt(5, aal.getMileage());
			pstmt.setString(6, user.getId());
			System.out.println(" >>> SQL : " + SQL2 + "<<<");
			int result2 = pstmt.executeUpdate();
			if(result2 >= 1) {
				return true;
			}else {
				return false;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}
	
	public boolean deleteLine(String line_no) {
		
		String SQL = "DELETE FROM list WHERE line_no = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, line_no);
			int result = pstmt.executeUpdate();
			return result > 1 ? true : false;
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return false;
	}

}