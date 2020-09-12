package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberUserDB {
	
	private static MemberUserDB instance = new MemberUserDB();
	
	public static MemberUserDB getinstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		Connection con = null;
		String url = "jdbc:mysql://localhost:3306/mysql?serverTimezone=UTC"; 
		String user = "root";
		String pwd = "1234";
		
		try { 
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection(url, user, pwd);
			
			} catch (Exception e) { 
				e.printStackTrace();
			}
		return con;
	}
	
	public int insertMember(MemberUser member) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String insertQuery="insert into users values(?,?,?,?);";
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(insertQuery);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPassword());
			
			pstmt.executeUpdate();
			re=1;
			con.close();
			System.out.println("추가 성공");
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("추가 실패");
		}
		return re;
	}
	//중복검사
	public int idCheck(String id) throws Exception{
		MemberUser member= new MemberUser();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1;
		String checkQuery="select id from users where id=?";
		
		try {
			con = getConnection();
			pstmt=con.prepareStatement(checkQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				re = 1;
			}
			else {
				re=-1;
			}
			rs.close();
			pstmt.close();
			con.close();
		}catch(Exception e) {

		}
		return re;
	}
	public int login(String id, String password) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int re = -1;
		String loginQuery="select id, password from users where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(loginQuery);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(password.equals(rs.getString("password"))) {
					re=1;
				}else {
					re=-1;
				}
			}
			else if(!rs.next()){
					re=0;
			}
		}catch(Exception e) {}
		return re;
	}
	
	public MemberUser getmember(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberUser member = null;
		String getmember="select * from users where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(getmember);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberUser();
				member.setId(rs.getNString("id"));
				member.setName(rs.getString("name"));
				member.setEmail(rs.getString("email"));
				member.setPassword(rs.getString("password"));
			}
			rs.close();
			pstmt.close();
			con.close();
			}catch(Exception e) {}
		return member;
	}
	public int updatemember(String id, String password, String email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String sql="update users set password=?, email=? where id=?";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, password);
			pstmt.setString(2, email);
			pstmt.setString(3, id);
			
			re = pstmt.executeUpdate();
			re=1;
		}catch(Exception e) {
			e.printStackTrace();
			re = -1;
		}
		return re;
	}
	
}
