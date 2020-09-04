package UserDiary;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class DiaryListDB {
	
private static DiaryListDB instance = new DiaryListDB();
	
	public static DiaryListDB getinstance() {
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

	//다이어리 내용, 타이틀 작성 후 저장하기
	public int insertDiary(DiaryList diarylist) throws Exception{
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		String diary_insertQuery="insert into diary(title, dia_con, date, writer) values(?,?,?,?);";
		diarylist.setDate(diarylist.getYear(), diarylist.getMonth(), diarylist.getDay());
		
		try {
			con=getConnection();
			pstmt=con.prepareStatement(diary_insertQuery);
			pstmt.setString(1, diarylist.getTitle());
			pstmt.setString(2, diarylist.getContent());
			pstmt.setDate(3, diarylist.getDate());
			pstmt.setString(4, diarylist.getWriter());
			
			pstmt.executeUpdate();
			re=1;
			System.out.println("추가 성공");
			System.out.println(diarylist.getDate());
			
		
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("추가 실패");
		}
		return re;

	}
	
	//전체 내용 받아오기
	public ArrayList<DiaryList> getAll(String writer,int start) throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from diary where writer=? order by id desc "
					+"Limit ?, 5";

		ArrayList<DiaryList> diarylist = new ArrayList<>();
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setInt(2, start);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				diarylist.add(new DiaryList(rs.getInt(1),rs.getString(2),rs.getString(3)
								,rs.getDate(4),rs.getString(5)));
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return diarylist;

	}
	//아이디 받아오기 위한 처리
	public ResultSet selectRow(String writer)throws SQLException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM diary WHERE writer=?;";
		

		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;
	}
	//제목 클릭시 내용 보여주기
	public ResultSet showcontent(int d_id) throws SQLException {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM diary WHERE id=?;";
		
		try {
			con = getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, d_id);
			rs = pstmt.executeQuery();
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return rs;

	}
	public int Updatediary(String d_title, String d_content, int d_id) throws SQLException{
		Connection con = null;
		Statement stmt = null;
		int re=-1;
		
		String updatesql = "update diary set dia_con = '"+d_content+"'"+", title ='"+d_title+"'"
							+" where id = "+d_id;
					
		
		try {
			con = getConnection();
			con.setAutoCommit(false);
			stmt = con.createStatement();
			stmt.executeUpdate(updatesql);
			
			con.commit();
			con.setAutoCommit(true);
			
			re=1;
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return re;
	}
	public int deletediary(int d_id) throws SQLException{
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		
		String sql = "DELETE FROM diary WHERE id=?";
		
		try {
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, d_id);
			pstmt.executeUpdate();
			re = 1;
			con.setAutoCommit(true);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return re;
	}
	public int getPage(String writer) {
		int cnt=0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =  null;
		
		String sql="select count(*) cnt from diary where writer=?";
		
		try {
			con=getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cnt = rs.getInt("cnt");
				System.out.print("total"+cnt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}

}
