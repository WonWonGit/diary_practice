package UserTodo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;


public class TodoListDB{

private static TodoListDB instance = new TodoListDB();
	
	public static TodoListDB getinstance() {
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
	// 데이터 입력 시키기
	public int insertTodo(TodoList todolist) {
		Connection con = null;
		PreparedStatement pstmt = null;
		int re = -1;
		ResultSet rs = null;
		int max=0;
		int result = 0;
		String sql=null;
		
		try {
			sql = "select max(t_id) from todo";
			con=getConnection();
			pstmt=con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
				if(rs==null) {
					max = 1;
				}else {
					max = result+1;
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(result);
		}finally {
			sql = "insert into todo values(?,?,?,?)";
				todolist.setT_id(max);
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, todolist.getT_id());
				pstmt.setString(2, todolist.getTodo_con());
				pstmt.setTimestamp(3, todolist.getDate());
				pstmt.setString(4, todolist.getWriter());
				pstmt.executeUpdate();
				re = 1;
				System.out.print("성공");
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(result);
				re = -1;
			}
		}
		return re;	
	}
	public ArrayList<TodoList> get(String writer, Timestamp date){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql=null;
		ArrayList<TodoList>todolist = new ArrayList();
		
		try {
			sql = " delete from todo where date < (select date_format(now(),'%y-%m-%d'));";
			con = getConnection();
			con.setAutoCommit(false);
			pstmt = con.prepareStatement(sql);
			pstmt.setTimestamp(1, date);
			pstmt.executeUpdate();
			con.setAutoCommit(true);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				
				sql = "select * from todo where writer=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, writer);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					todolist.add(new TodoList(rs.getInt(1),rs.getString(2)
									,rs.getTimestamp(3),rs.getString(4)));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		return todolist;
		
	}
	
	
}
