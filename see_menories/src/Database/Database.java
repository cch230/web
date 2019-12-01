package Database;

import java.sql.*;

import model.user;

public class Database {

	private String url = "jdbc:mysql://localhost:3306/seememories";
	private String id = "root";
	private String pw = "Cch951753!";

	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public Object executQuery(String query, Object object) {

		Object result = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, id, pw);

			switch (query) {
			case "insert_user":
				result = insert_user((user) object);
				break;
			case "update_user":
				result = update_user((user) object);
				break;
			case "delete_user":
				result = delete_user((user) object);
				break;
			case "select_user":
				result = select_user((user) object);
				break;
			}


		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("데이터베이스 연결에 실패했습니다.");
			result = null;
			
		} finally {
			// PreparedStatement 객체 해제
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException sqle) {
				}
			// Connection 해제
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException sqle) {
				}
		}

		return result;
	}

	public boolean insert_user(user user) {

		boolean result = false;
		try {
			String sql = "insert into user values(?,?,?,?,?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getNickname());
			pstmt.setString(5, user.getBirth());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getquestion());
			pstmt.setString(8, user.getanswer());
			pstmt.setInt(9, 0);

			pstmt.executeUpdate();

			conn.commit();

			System.out.println("새로운 회원 추가에 성공했습니다.");

			result = true;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("새로운 회원 추가에 실패했습니다.");
			// 쿼리가 성공 또는 실패에 상관없이 사용한 자원을 해제 한다. (순서중요)
			result = false;
		}
		
		return result;
	}
	
	public boolean update_user(user user) {

		boolean result = false;
		try {
			String sql = "update user set (pw,name,nickname,birth,phone) = (?,?,?,?,?,?) where id = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getPw());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getNickname());
			pstmt.setString(4, user.getBirth());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getId());

			pstmt.executeUpdate();

			conn.commit();

			System.out.println("회원 정보 수정에 성공했습니다.");

			result = true;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원 정보 수정에 실패했습니다.");
			result = false;
		}
		
		return result;
	}
	
	public boolean delete_user(user user) {

		boolean result = false;
		try {
			String sql = "delete from user where id = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getId());
			
			pstmt.executeUpdate();

			conn.commit();

			System.out.println("회원 삭제에 성공했습니다.");

			result = true;

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원 삭제에 실패했습니다.");
			result = false;
		}
		
		return result;
	}
	
	public ResultSet select_user(user user) {
		ResultSet rs = null;

		try {
			String sql = "select * from user where id = ? or name = ? or nickname = ?"; // sql 쿼리

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getNickname());
			
			
			rs = pstmt.executeQuery();
			
			System.out.println("회원 조회에 성공했습니다.");


		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원 조회에 실패했습니다.");
			rs = null;
		}
		
		return rs;
	}
	
	
	
	
	
}
