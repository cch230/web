package Database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Comment;
import model.user;
import model.Location;
import model.photo;
import model.info;
import model.Root;
public class photoUserDAO {

	private static photoUserDAO instance;

	private Connection connection;

	private photoUserDAO() {

		try {
			System.out.println("연결");

			Class.forName("com.mysql.jdbc.Driver");

			connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/seememories?useUnicode=true&characterEncoding=utf8", "root",
					"Cch951753!");

		} catch (SQLException e) {

			System.out.println("데이터베이스 연결에 실패했습니다.");
			e.printStackTrace();

		} catch (ClassNotFoundException e) {
			System.out.println("클래스가 없습니다.");
			e.printStackTrace();

		}

	}

	public static photoUserDAO getInstance() {

		if (instance == null)

			instance = new photoUserDAO();

		return instance;

	}

	
	//유저 과니자 판별
	public int whouser(String user_id) {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int flag=0;
		
		try {
			System.out.println(user_id);
			pstmt = connection.prepareStatement("select id from root where id= ? ");

			pstmt.setString(1, user_id);

			rs=pstmt.executeQuery();

			if (rs.next()) {

				if(rs.getString(1)!=null)
					flag=1;
			}
		} catch (SQLException e) {
			flag=0;
			e.printStackTrace();

		} finally {

			if (pstmt != null) {
				try {
					pstmt.close();
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
		}
		return flag;
	}

	
	
	
	// 게시글 추가 함수
	// 0-> 성공 1->실패
	public int insertphoto(photo photo, String user_id) {

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;

		int return_code = -1;

		try {

			pstmt = connection
					.prepareStatement("insert into photo(user_id,title,tag,location,content) values(?,?,?,?,?)");

			pstmt.setString(1, user_id);
			pstmt.setString(2, photo.getTitle());
			pstmt.setString(3, photo.getTag());
			pstmt.setString(4, photo.getLocation());
			pstmt.setString(5, photo.getContent());

			pstmt.executeUpdate();

			pstmt2 = connection.prepareStatement("SELECT LAST_INSERT_ID();");
			rs = pstmt2.executeQuery();

			String[] pop = photo.getPhoto();

			if (rs.next()) {

				int id = rs.getInt("LAST_INSERT_ID()");
				for (int i = 0; i < 3; i++) {
					// System.out.println(id);
					// System.out.println(photo[i]);

					if (pop[i].equals(""))
						continue;
					insertphotoPhoto(pop[i], id);
				}

			}

			return_code = 0;

		} catch (SQLException e) {

			System.out.println("게시글 추가에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt2 != null)
				try {
					pstmt2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return return_code;

	}

	// 공지 추가 함수
		// 0-> 성공 1->실패
		public int insertInfo(photo photo, String user_id) {

			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			ResultSet rs = null;

			int return_code = -1;

			try {

				pstmt = connection
						.prepareStatement("insert into info(user_id,title,tag,location,content) values(?,?,?,?,?)");

				pstmt.setString(1, user_id);
				pstmt.setString(2, photo.getTitle());
				pstmt.setString(3, photo.getTag());
				pstmt.setString(4, photo.getLocation());
				pstmt.setString(5, photo.getContent());

				pstmt.executeUpdate();

				pstmt2 = connection.prepareStatement("SELECT LAST_INSERT_ID();");
				rs = pstmt2.executeQuery();

				String[] pop = photo.getPhoto();

				if (rs.next()) {

					int id = rs.getInt("LAST_INSERT_ID()");
					for (int i = 0; i < 3; i++) {
						// System.out.println(id);
						// System.out.println(photo[i]);

						if (pop[i].equals(""))
							continue;
						insertinfoinfo(pop[i], id);
					}

				}

				return_code = 0;

			} catch (SQLException e) {

				System.out.println("게시글 추가에 실패했습니다.");
				e.printStackTrace();
				return_code = 1;

			} finally {

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if (pstmt2 != null)
					try {
						pstmt2.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}
			return return_code;

		}
	
	
	
	public int insertphotoPhoto(String photo, int id) {

		PreparedStatement pstmt = null;

		int return_code = -1;

		try {
			pstmt = connection.prepareStatement("insert into photo_detail values(?,?)");

			pstmt.setInt(1, id);
			pstmt.setString(2, photo);

			pstmt.executeUpdate();

			return_code = 0;

		} catch (SQLException e) {

			System.out.println("사진 추가에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return return_code;

	}
	
	public int insertinfoinfo (String photo, int id) {

		PreparedStatement pstmt = null;

		int return_code = -1;

		try {
			pstmt = connection.prepareStatement("insert into info_detail values(?,?)");

			pstmt.setInt(1, id);
			pstmt.setString(2, photo);

			pstmt.executeUpdate();

			return_code = 0;

		} catch (SQLException e) {

			System.out.println("사진 추가에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return return_code;

	}


	public void deletephotoPhoto(int id) {
		PreparedStatement pstmt = null;

		try {

			pstmt = connection.prepareStatement("delete from photo_detail where id = ?");

			pstmt.setInt(1, id);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("사진 삭제에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}

	// 게시글 업데이트 함수
	public int updatephoto(photo photo, String user_id) {

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;

		int return_code = -1;

		try {
			pstmt = connection
					.prepareStatement("update photo set title = ?, tag = ?, location = ?, content = ? where id = ?");

			pstmt.setString(1, photo.getTitle());
			pstmt.setString(2, photo.getTag());
			pstmt.setString(3, photo.getLocation());
			pstmt.setString(4, photo.getContent());
			pstmt.setInt(5, photo.getId());

			pstmt.executeUpdate();

			String[] pop = photo.getPhoto();

			deletephotoPhoto(photo.getId());

			for (int i = 0; i < 3; i++) {
				if (pop[i].equals(""))
					continue;
				insertphotoPhoto(pop[i], photo.getId());

			}

			return_code = 0;

		} catch (SQLException e) {

			System.out.println("게시글 추가에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt2 != null)
				try {
					pstmt2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return return_code;
	}

	// 유저의 게시글 전체 삭제
	public void deleteAllphoto(String user_id) {

		PreparedStatement pstmt = null;

		try {

			pstmt = connection.prepareStatement("delete from photo where user_id = ?");

			pstmt.setString(1, user_id);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("전체 게시글 삭제에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	public void deleteAllphoto() {

		PreparedStatement pstmt = null;

		try {

			pstmt = connection.prepareStatement("delete from photo");


			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("전체 게시글 삭제에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	
	
	
	
	
	// 게시글 지정 삭제
	public void deletephoto(int photo_id) {

		PreparedStatement pstmt = null;

		try {

			pstmt = connection.prepareStatement("delete from photo where id = ?");

			pstmt.setInt(1, photo_id);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("게시글 삭제에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}
	
	
	// 게시글 지정 삭제
		public void deletecomment(int id) {

			PreparedStatement pstmt = null;

			try {

				pstmt = connection.prepareStatement("delete from comment where id = ?");

				pstmt.setInt(1, id);

				pstmt.executeUpdate();

			} catch (SQLException e) {

				System.out.println("게시글 삭제에 실패했습니다.");
				e.printStackTrace();

			} finally {

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}

		}
	

	// 지정한 id값을 가진 게시글 조회
	public photo selectOnephoto(int photo_id) {

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;

		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;

		photo photo = new photo();

		try {

			pstmt = connection.prepareStatement("select * from photo where id = ? ");
			pstmt.setInt(1, photo_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				pstmt2 = connection.prepareStatement("select * from user where id = ?");
				pstmt2.setString(1, rs.getString("user_id"));
				rs2 = pstmt2.executeQuery();

				if (rs2.next()) {

					photo.setId(rs.getInt("id"));
					photo.setuser_id(rs.getString("user_id"));
					photo.setuser_name(rs2.getString("name"));
					photo.setTitle(rs.getString("title"));
					photo.setTag(rs.getString("tag"));
					photo.setLocation(rs.getString("location"));
					photo.setContent(rs.getString("content"));
					photo.setLike_num(rs.getInt("like_num"));
					photo.setReg_Date(rs.getString("reg_date"));
					photo.setComment_num(getphotoComment(rs.getInt("id")));

					pstmt3 = connection.prepareStatement("select * from photo_detail where id = ?");
					pstmt3.setInt(1, rs.getInt("id"));
					rs3 = pstmt3.executeQuery();

					String[] pop= new String[3];
					int i = 0;
					while (rs3.next()) {
						pop[i] = rs3.getString("photo");
						i++;
					}
					photo.setPhoto(pop);

				}

			}

		} catch (SQLException e) {

			System.out.println("모든 게시글 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt2 != null)
				try {
					pstmt2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}

		return photo;

	}
	
	
	
	
	
	
	
	
	
	
	
	// 모든 공지  조회
		public List<info> selectAllinfo() {

			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;

			ResultSet rs = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;

			List<info> list = new ArrayList<info>();

			try {

				pstmt = connection.prepareStatement("select * from info order by reg_date desc ");

				rs = pstmt.executeQuery();

				while (rs.next()) {

					pstmt2 = connection.prepareStatement("select * from info where id = ?");
					pstmt2.setString(1, rs.getString("user_id"));
					rs2 = pstmt2.executeQuery();

					if (rs2.next()) {

						info info = new info();

						info.setId(rs.getInt("id"));
						info.setuser_id(rs.getString("user_id"));
						info.setuser_name(rs2.getString("name"));
						info.setTitle(rs.getString("title"));
						info.setTag(rs.getString("tag"));
						info.setLocation(rs.getString("location"));
						info.setContent(rs.getString("content"));
						info.setLike_num(rs.getInt("like_num"));
						info.setReg_Date(rs.getString("reg_date"));
						info.setComment_num(getphotoComment(rs.getInt("id")));

						pstmt3 = connection.prepareStatement("select * from info_detail where id = ?");
						pstmt3.setInt(1, rs.getInt("id"));
						rs3 = pstmt3.executeQuery();

						String[] pop = new String[3];
						int i = 0;
						while (rs3.next()) {
							pop[i] = rs3.getString("info");
							i++;
						}
						info.setinfo(pop);

						list.add(info);

					}

				}

			} catch (SQLException e) {

				System.out.println("모든 게시글 조회에 실패했습니다.");
				e.printStackTrace();

			} finally {

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if (pstmt2 != null)
					try {
						pstmt2.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

			}

			return list;

		}

		
		
		
		
		// 유저의 게시물 조회
		public List<info> selectAllinfo(String user_id) {

			PreparedStatement pstmt = null;
			PreparedStatement pstmt2 = null;
			PreparedStatement pstmt3 = null;

			ResultSet rs = null;
			ResultSet rs2 = null;
			ResultSet rs3 = null;

			List<info> list = new ArrayList<info>();

			try {

				pstmt = connection.prepareStatement("select * from info where user_id = ? order by reg_date desc");
				pstmt.setString(1, user_id);

				rs = pstmt.executeQuery();

				while (rs.next()) {

					pstmt2 = connection.prepareStatement("select * from info where id = ?");
					pstmt2.setString(1, rs.getString("user_id"));
					rs2 = pstmt2.executeQuery();

					if (rs2.next()) {

						info info = new info();

						info.setId(rs.getInt("id"));
						info.setuser_id(rs.getString("user_id"));
						info.setuser_name(rs2.getString("name"));
						info.setTitle(rs.getString("title"));
						info.setTag(rs.getString("tag"));
						info.setLocation(rs.getString("location"));
						info.setContent(rs.getString("content"));
						info.setLike_num(rs.getInt("like_num"));
						info.setReg_Date(rs.getString("reg_date"));
						info.setComment_num(getphotoComment(rs.getInt("id")));

						pstmt3 = connection.prepareStatement("select * from info_detail where id = ?");
						pstmt3.setInt(1, rs.getInt("id"));
						rs3 = pstmt3.executeQuery();

						String[] pop = new String[3];
						int i = 0;
						while (rs3.next()) {
							pop[i] = rs3.getString("info");
							i++;
						}
						info.setinfo(pop);

						list.add(info);

					}

				}

			} catch (SQLException e) {

				System.out.println("모든 게시글 조회에 실패했습니다.");
				e.printStackTrace();

			} finally {

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if (pstmt2 != null)
					try {
						pstmt2.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

			}

			return list;

		}
	
	
	
	
	
	
	
	
	

	// 모든 게시물 조회
	public List<photo> selectAllphoto() {

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;

		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;

		List<photo> list = new ArrayList<photo>();

		try {

			pstmt = connection.prepareStatement("select * from photo order by reg_date desc ");

			rs = pstmt.executeQuery();

			while (rs.next()) {

				pstmt2 = connection.prepareStatement("select * from user where id = ?");
				pstmt2.setString(1, rs.getString("user_id"));
				rs2 = pstmt2.executeQuery();

				if (rs2.next()) {

					photo photo = new photo();

					photo.setId(rs.getInt("id"));
					photo.setuser_id(rs.getString("user_id"));
					photo.setuser_name(rs2.getString("name"));
					photo.setTitle(rs.getString("title"));
					photo.setTag(rs.getString("tag"));
					photo.setLocation(rs.getString("location"));
					photo.setContent(rs.getString("content"));
					photo.setLike_num(rs.getInt("like_num"));
					photo.setReg_Date(rs.getString("reg_date"));
					photo.setComment_num(getphotoComment(rs.getInt("id")));

					pstmt3 = connection.prepareStatement("select * from photo_detail where id = ?");
					pstmt3.setInt(1, rs.getInt("id"));
					rs3 = pstmt3.executeQuery();

					String[] pop = new String[3];
					int i = 0;
					while (rs3.next()) {
						pop[i] = rs3.getString("photo");
						i++;
					}
					photo.setPhoto(pop);

					list.add(photo);

				}

			}

		} catch (SQLException e) {

			System.out.println("모든 게시글 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt2 != null)
				try {
					pstmt2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}

		return list;

	}

	
	
	
	
	// 유저의 게시물 조회
	public List<photo> selectAllphoto(String user_id) {

		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		PreparedStatement pstmt3 = null;

		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;

		List<photo> list = new ArrayList<photo>();

		try {

			pstmt = connection.prepareStatement("select * from photo where user_id = ? order by reg_date desc");
			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				pstmt2 = connection.prepareStatement("select * from user where id = ?");
				pstmt2.setString(1, rs.getString("user_id"));
				rs2 = pstmt2.executeQuery();

				if (rs2.next()) {

					photo photo = new photo();

					photo.setId(rs.getInt("id"));
					photo.setuser_id(rs.getString("user_id"));
					photo.setuser_name(rs2.getString("name"));
					photo.setTitle(rs.getString("title"));
					photo.setTag(rs.getString("tag"));
					photo.setLocation(rs.getString("location"));
					photo.setContent(rs.getString("content"));
					photo.setLike_num(rs.getInt("like_num"));
					photo.setReg_Date(rs.getString("reg_date"));
					photo.setComment_num(getphotoComment(rs.getInt("id")));

					pstmt3 = connection.prepareStatement("select * from photo_detail where id = ?");
					pstmt3.setInt(1, rs.getInt("id"));
					rs3 = pstmt3.executeQuery();

					String[] pop = new String[3];
					int i = 0;
					while (rs3.next()) {
						pop[i] = rs3.getString("photo");
						i++;
					}
					photo.setPhoto(pop);

					list.add(photo);

				}

			}

		} catch (SQLException e) {

			System.out.println("모든 게시글 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			if (pstmt2 != null)
				try {
					pstmt2.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}

		return list;

	}

	// 회원 등록
	// 0-> 성공 1->이미 있는 회원 2->실패
	public int insertuser(user user) {

		PreparedStatement pstmt = null;

		int return_code = -1;

		try {
			pstmt = connection.prepareStatement("insert into user values(?,?,?,?,?,?,?,?,?,?)");

			pstmt.setString(1, user.getId());
			pstmt.setString(2, user.getPw());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getNickname());
			pstmt.setString(5, user.getBirth());
			pstmt.setString(6, user.getPhone());
			pstmt.setString(7, user.getquestion());
			pstmt.setString(8, user.getanswer());
			pstmt.setInt(9, 0);
			pstmt.setString(10, "image/none.png");

			pstmt.executeUpdate();
			return_code = 0;

		} catch (SQLException e) {

			System.out.println("회원 등록에 실패했습니다.");
			return_code = 2;

			if (e.getErrorCode() == 1062) {// 이미 있는 회원
				return_code = 1;
			}
			// e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;

	}

	// 회원 정보 업데이트
	public int updateuser(user user) {

		PreparedStatement pstmt = null;

		int return_code = -1;

		try {
			pstmt = connection.prepareStatement(
					"update user set pw = ?,name = ?,nickname = ?,birth = ?, phone = ?, profile= ? where id = ? ");

			pstmt.setString(7, user.getId());
			pstmt.setString(1, user.getPw());
			pstmt.setString(2, user.getName());
			pstmt.setString(3, user.getNickname());
			pstmt.setString(4, user.getBirth());
			pstmt.setString(5, user.getPhone());
			pstmt.setString(6, user.getProfile());

			pstmt.executeUpdate();
			return_code = 0;

		} catch (SQLException e) {

			System.out.println("회원 정보 수정에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return return_code;

	}

	// 회원 삭제
	public void deleteuser(String user_id) {

		PreparedStatement pstmt = null;

		try {

			deleteAllphoto(user_id);

			pstmt = connection.prepareStatement("delete from user where id = ?");

			pstmt.setString(1, user_id);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("회원 삭제에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	// 모든 유저 조회
	public List<user> selectAlluser() {

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<user> list = new ArrayList<user>();

		try {

			pstmt = connection.prepareStatement("select * from user");

			rs = pstmt.executeQuery();

			while (rs.next())

			{
				user user = new user();

				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setBirth(rs.getString("birth"));
				user.setPhone(rs.getString("phone"));
				user.setProfile(rs.getString("profile"));
				user.setLike_num(rs.getInt("like_num"));
				user.setphoto_num(getphotoCount(rs.getString("id")));
				user.setMylike_num(getMyLikeCount(rs.getString("id")));

				list.add(user);

			}

		} catch (SQLException e) {

			System.out.println("모든 유저 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return list;

	}

	// 회원 조회
	public user selectOneuser(String user_id) {

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		user user = new user();

		try {

			pstmt = connection.prepareStatement("select * from user where id = ?");

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setBirth(rs.getString("birth"));
				user.setPhone(rs.getString("phone"));
				user.setProfile(rs.getString("profile"));
				user.setLike_num(rs.getInt("like_num"));
				user.setphoto_num(getphotoCount(rs.getString("id")));
				user.setMylike_num(getMyLikeCount(rs.getString("id")));

			}

		} catch (SQLException e) {

			System.out.println("회원 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return user;

	}

	// 검색 기능 (키워드가 들어간 유저와 게시글 )
	public List<photo> searchphoto(String keyword) {

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<photo> list = new ArrayList<photo>();

		try {

			String sql = "select * from photo where location like '%" + keyword + "%' order by like_num desc";

			pstmt = connection.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next())

			{
				photo photo = selectOnephoto(rs.getInt("id"));

				list.add(photo);

			}

		} catch (SQLException e) {

			System.out.println("게시글 검색에  실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return list;

	}

	
	// 검색 기능 (키워드가 들어간 유저와 게시글 )
		public List<photo> searchphoto(String keyword,String tag) {

			PreparedStatement pstmt = null;

			ResultSet rs = null;

			List<photo> list = new ArrayList<photo>();

			try {

				String sql = "select * from photo where location like '%" + keyword + "%' and tag = '"+tag+"' order by like_num desc";

				pstmt = connection.prepareStatement(sql);
				System.out.println(pstmt);

				rs = pstmt.executeQuery();

				int i=0;
				while (rs.next())
				{	i++;
					photo photo = selectOnephoto(rs.getInt("id"));

					list.add(photo);
					if(i == 2)
						break;

				}

			} catch (SQLException e) {

				System.out.println("게시글 검색에  실패했습니다.");
				e.printStackTrace();

			} finally {

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}

			return list;

		}
	public List<user> searchuser(String keyword) {

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<user> list = new ArrayList<user>();

		try {

			String sql = "select * from user where id like '%" + keyword + "%' or name like '%" + keyword
					+ "%' or nickname  '%" + keyword + "%'";

			pstmt = connection.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next())

			{
				user user = new user();

				user.setId(rs.getString("id"));
				user.setPw(rs.getString("pw"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setBirth(rs.getString("birth"));
				user.setPhone(rs.getString("phone"));
				user.setLike_num(rs.getInt("like_num"));

				list.add(user);

			}

		} catch (SQLException e) {

			System.out.println("회원 검색에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return list;

	}

	public boolean isLike(String like_user_id, String user_id) {
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		boolean return_code = false;

		try {

			pstmt = connection.prepareStatement("select * from user_like where like_user_id = ? and user_id = ?");

			pstmt.setString(1, like_user_id);
			pstmt.setString(2, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return_code = true;

			} else {
				return_code = false;
			}

		} catch (SQLException e) {

			System.out.println("좋아요 확인에 실패했습니다.");
			return_code = false;
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;
	}

	public boolean isLike(int photo_id, String user_id) {
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		boolean return_code = false;

		try {

			pstmt = connection.prepareStatement("select * from photo_like where photo_id = ? and user_id = ?");

			pstmt.setInt(1, photo_id);
			pstmt.setString(2, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				return_code = true;

			} else {
				return_code = false;
			}

		} catch (SQLException e) {

			System.out.println("좋아요 확인에 실패했습니다.");
			return_code = false;
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;
	}

	// --회원 좋아요
	public int deleteLike(user like_user, user user) {
		PreparedStatement pstmt = null;

		int return_code = -1;
		try {
			pstmt = connection.prepareStatement("delete from user_like where like_user_id = ? and user_id = ?");

			pstmt.setString(1, like_user.getId());
			pstmt.setString(2, user.getId());

			pstmt.executeUpdate();

			updateLike(like_user, -1);
			return_code = 0;

		} catch (SQLException e) {

			System.out.println("좋아요 취소에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;
	}

	public int insertLike(user like_user, user user) {
		PreparedStatement pstmt = null;

		int return_code = -1;
		try {
			pstmt = connection.prepareStatement("insert into user_like values(?,?) ");

			pstmt.setString(1, like_user.getId());
			pstmt.setString(2, user.getId());

			pstmt.executeUpdate();

			updateLike(like_user, 1);
			return_code = 0;

		} catch (SQLException e) {

			System.out.println("좋아요 등록에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;

	}

	public void updateLike(user user, int order) {

		PreparedStatement pstmt = null;

		try {
			pstmt = connection.prepareStatement("update user set like_num = ? where id = ?");

			pstmt.setString(2, user.getId());
			pstmt.setInt(1, user.getLike_num() + order);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("회원 좋아요 업데이트에 실패했습니다.");
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}
	// --회원 좋아요

	// --게시글 좋아요
	public int deleteLike(photo photo, user user) {
		PreparedStatement pstmt = null;

		int return_code = -1;
		try {
			pstmt = connection.prepareStatement("delete from photo_like where photo_id = ? and user_id = ?");

			pstmt.setInt(1, photo.getId());
			pstmt.setString(2, user.getId());

			pstmt.executeUpdate();

			updateLike(photo, -1);
			return_code = 0;

		} catch (SQLException e) {

			System.out.println("좋아요 취소에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;
	}

	public int insertLike(photo photo, user user) {
		PreparedStatement pstmt = null;

		int return_code = -1;
		try {
			pstmt = connection.prepareStatement("insert into photo_like values(?,?) ");

			pstmt.setInt(1, photo.getId());
			pstmt.setString(2, user.getId());

			pstmt.executeUpdate();

			updateLike(photo, 1);
			return_code = 0;

		} catch (SQLException e) {

			System.out.println("좋아요 등록에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;

	}

	public void updateLike(photo photo, int order) {

		PreparedStatement pstmt = null;

		try {
			pstmt = connection.prepareStatement("update photo set like_num = ? where id = ?");

			pstmt.setInt(2, photo.getId());
			pstmt.setInt(1, photo.getLike_num() + order);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("게시글 좋아요 업데이트에 실패했습니다.");
			e.printStackTrace();
		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}
	// --게시글 좋아요

	// 로그인
	// 0->성공 1->비밀번호 틀림 2->없음 3->실패
	public int checkuser(user user) {

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		int return_code = -1;

		try {

			pstmt = connection.prepareStatement("select * from user where id = ?");

			pstmt.setString(1, user.getId());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				if (user.getPw().equals(rs.getString("pw")))
					return_code = 0;
				else
					return_code = 1;

			} else {
				return_code = 2;
			}

		} catch (SQLException e) {

			System.out.println("로그인 확인에 실패했습니다.");
			return_code = 3;
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return return_code;

	}

	// 비밀번호 찾기
		// 0->성공 1->질문 틀림 2->ID틀림 3->실패
		public int findpassword(user user) {

			PreparedStatement pstmt = null;

			ResultSet rs = null;

			int return_code = -1;

			try {

				pstmt = connection.prepareStatement("select * from user where id = ?");

				pstmt.setString(1, user.getId());
				rs = pstmt.executeQuery();

				if (rs.next()) {
					if (user.getquestion().equals(rs.getString("question")) && user.getanswer().equals(rs.getString("answer"))) {
							return_code = 0;
							System.out.println(return_code);

					}
					else {
						System.out.println(return_code);

						return_code =1;
					}
					}
				else
					return_code = 2;
			} catch (SQLException e) {

				System.out.println(" 비밀번호 찾기가 실패했습니다.");
				return_code = 3;
				e.printStackTrace();

			} finally {

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if (rs != null) {
					try {
						rs.close();
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}

			return return_code;

		}

		public String findpwfin(user user) {
			PreparedStatement pstmt = null;
			String result = null;
			ResultSet rs = null;

			try {
				pstmt = connection.prepareStatement("select pw from user where id = ? and question = ? and answer =	?");
				pstmt.setString(1, user.getId());
				pstmt.setString(2, user.getquestion());
				pstmt.setString(3, user.getanswer());

				rs = pstmt.executeQuery();		
				while(rs.next()) {
					result=rs.getString(1);
					System.out.println(result);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}finally {

					if (pstmt != null)
						try {
							pstmt.close();
							
						} catch (SQLException e) {
							e.printStackTrace();
						}
					if (rs != null) {
						try {
							rs.close();
							
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}
			
				return result;
		}
		
		
			// 아이디 찾기
			// 0->성공 1-> 답 틀림 2->없음 3->실패
			public int findid(user user) {

				PreparedStatement pstmt = null;

				ResultSet rs = null;

				int return_code = -1;

				try {

					pstmt = connection.prepareStatement("select * from user where name = ? and phone = ?");

					pstmt.setString(1, user.getName());
					pstmt.setString(2, user.getPhone());

					rs = pstmt.executeQuery();
					if (rs.next()) {
						if (user.getPhone().equals(rs.getString("phone"))) {
							return_code = 0;
						}
						else {
							return_code = 1;
							System.out.println(return_code);}

					}
					else {
						return_code = 2;
						System.out.println(return_code);

					}
					
				} catch (SQLException e) {

					System.out.println(" 아이디 찾기가 실패했습니다.");
					return_code = 3;
					e.printStackTrace();

				} finally {

					if (pstmt != null)
						try {
							pstmt.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					if (rs != null) {
						try {
							rs.close();
							
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}
				}

				return return_code;

			}
	
			
	public String findidfin(user user) {
		PreparedStatement pstmt = null;
		String result = null;
		ResultSet rs = null;

		try {
			pstmt = connection.prepareStatement("select id from user where phone = ?");
			pstmt.setString(1, user.getPhone());
			rs = pstmt.executeQuery();		
			while(rs.next()) {
				result=rs.getString(1);
				System.out.println(result);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {

				if (pstmt != null)
					try {
						pstmt.close();
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
				if (rs != null) {
					try {
						rs.close();
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		
			return result;
	}
			
	// 댓글 등록
	public int insertComment(Comment comment) {

		PreparedStatement pstmt = null;

		int return_code = -1;

		try {

			pstmt = connection
					.prepareStatement("insert into comment(photo_id,user_id,user_name,comment) values(?,?,?,?)");

			pstmt.setInt(1, comment.getphoto_id());
			pstmt.setString(2, comment.getuser_id());
			pstmt.setString(3, comment.getuser_name());
			pstmt.setString(4, comment.getComment());

			pstmt.executeUpdate();

			return_code = 0;

		} catch (SQLException e) {

			System.out.println("댓글 추가에 실패했습니다.");
			e.printStackTrace();
			return_code = 1;

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}
		return return_code;

	}

	// 댓글 가져오기
	public List<Comment> selectAllComment(int photo_id) {

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<Comment> list = new ArrayList<Comment>();

		try {

			pstmt = connection.prepareStatement("select * from comment where photo_id = ? order by reg_date asc");
			pstmt.setInt(1, photo_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {

				Comment comment = new Comment();

				comment.setId(rs.getInt("id"));
				comment.setphoto_id(rs.getInt("photo_id"));
				comment.setuser_id(rs.getString("user_id"));
				comment.setuser_name(rs.getString("user_name"));
				comment.setComment(rs.getString("comment"));
				comment.setReg_date(rs.getString("reg_date"));

				list.add(comment);

			}

		} catch (

		SQLException e) {

			System.out.println("댓글 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}

		return list;

	}

	// 댓글 삭제
	public void deleteComment(int id) {

		PreparedStatement pstmt = null;

		try {

			pstmt = connection.prepareStatement("delete from comment where id = ?");

			pstmt.setInt(1, id);

			pstmt.executeUpdate();

		} catch (SQLException e) {

			System.out.println("댓글 삭제에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	public int getphotoCount(String user_id) {
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		int num = 0;

		try {

			pstmt = connection.prepareStatement("select count(*) from photo where user_id = ?");

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt("count(*)");

			}

		} catch (SQLException e) {

			System.out.println("좋아요 확인에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return num;
	}

	public int getphotoComment(int photo_id) {
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		int num = 0;

		try {

			pstmt = connection.prepareStatement("select count(*) from comment where photo_id = ?");

			pstmt.setInt(1, photo_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt("count(*)");

			}

		} catch (SQLException e) {

			System.out.println("댓글 확인에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return num;
	}

	public int getMyLikeCount(String user_id) {
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		int num = 0;

		try {

			pstmt = connection.prepareStatement("select count(*) from user_like where user_id = ?");

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				num = rs.getInt("count(*)");

			}

		} catch (SQLException e) {

			System.out.println("좋아요 확인에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return num;
	}

	// 좋아요 유저 조회
	public List<user> selectAlluser(String type, String user_id) {
		// type : like_user_id(like me) user_id(my like)

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<user> list = new ArrayList<user>();

		try {

			pstmt = connection.prepareStatement("select * from user_like where " + type + " = ?");
			pstmt.setString(1, user_id);

			System.out.println(pstmt);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				String id_name = type.equals("user_id") ? "like_user_id" : "user_id";
				user user = selectOneuser(rs.getString(id_name));

				list.add(user);

			}

		} catch (SQLException e) {

			System.out.println("모든 좋아요 유저 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return list;

	}

	// 지역 검색
	public List<Location> selectAllLoaction() {
		// type : like_user_id(like me) user_id(my like)

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<Location> list = new ArrayList<Location>();

		try {

			pstmt = connection.prepareStatement("select count(*),location from photo group by location order by count(*) desc");

			rs = pstmt.executeQuery();
			
			int i=0;
			while (rs.next()) {
				i++;
				Location location = new Location();
				location.setCount(rs.getInt("count(*)"));
				location.setLocation_name(rs.getString("location"));

				list.add(location);
				if(i==4)
					break;

			}

		} catch (SQLException e) {

			System.out.println("지역 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return list;

	}
	// 지역 검색
		public List<Location> selectAllLoaction(String year) {
			// type : like_user_id(like me) user_id(my like)

			PreparedStatement pstmt = null;

			ResultSet rs = null;

			List<Location> list = new ArrayList<Location>();

			try {

				String sql = "select count(*),location from photo where user_id in "+
				"(select id from user where birth >= '"+(Integer.parseInt(year)-4)+"' and birth <= '"+(Integer.parseInt(year)+4)+"') "+
				"group by location order by count(*) desc";
				
				pstmt = connection.prepareStatement(sql);

				rs = pstmt.executeQuery();
				
				int i=0;
				while (rs.next()) {
					i++;
					Location location = new Location();
					location.setCount(rs.getInt("count(*)"));
					location.setLocation_name(rs.getString("location"));

					list.add(location);
					if(i==4)
						break;

				}

			} catch (SQLException e) {

				System.out.println("지역 조회에 실패했습니다.");
				e.printStackTrace();

			} finally {

				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
			}

			return list;

		}

		//관리자 로그인
		   public int checkroot(Root root) {

		      PreparedStatement pstmt = null;

		      ResultSet rs = null;

		      int return_code = -1;

		      try {

		         pstmt = connection.prepareStatement("select * from root where id = ?");

		         pstmt.setString(1, root.getId());

		         rs = pstmt.executeQuery();

		         if (rs.next()) {
		            if (root.getPw().equals(rs.getString("pw")))
		               return_code = 0;
		            else
		               return_code = 1;

		         } else {
		            return_code = 2;
		         }

		      } catch (SQLException e) {

		         System.out.println("로그인 확인에 실패했습니다.");
		         return_code = 3;
		         e.printStackTrace();

		      } finally {

		         if (pstmt != null)
		            try {
		               pstmt.close();
		            } catch (SQLException e) {
		               e.printStackTrace();
		            }
		      }

		      return return_code;

		   }
		
		//root 계정 조회
		   public Root selectOneroot(String root_id) {

		      PreparedStatement pstmt = null;

		      ResultSet rs = null;

		      Root root = new Root();

		      try {

		         pstmt = connection.prepareStatement("select * from root where id = ?");

		         pstmt.setString(1, root_id);

		         rs = pstmt.executeQuery();

		         if (rs.next()) {

		            root.setId(rs.getString("id"));
		            root.setPw(rs.getString("pw"));
		         
		         }

		      } catch (SQLException e) {

		         System.out.println("관리자 조회에 실패했습니다.");
		         e.printStackTrace();

		      } finally {

		         if (pstmt != null)
		            try {
		               pstmt.close();
		            } catch (SQLException e) {
		               e.printStackTrace();
		            }
		      }

		      return root;

		   }
		
	// 인기 게시물
	public List<photo> selectphotoularphoto() {

		PreparedStatement pstmt = null;

		ResultSet rs = null;

		List<photo> list = new ArrayList<photo>();

		try {

			pstmt = connection.prepareStatement("select * from photo order by like_num desc");

			rs = pstmt.executeQuery();

			int i = 0;
			while (rs.next()) {
				i++;
				photo photo = selectOnephoto(rs.getInt("id"));
				list.add(photo);
				if (i == 2)
					break;

			}

		} catch (SQLException e) {

			System.out.println("인기있는 게시물 조회에 실패했습니다.");
			e.printStackTrace();

		} finally {

			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return list;

	}

}
