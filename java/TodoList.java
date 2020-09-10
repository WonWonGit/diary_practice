package UserTodo;


import java.sql.Date;
import java.sql.Timestamp;

public class TodoList {
	private int t_id;
	private String todo_con;
	private Timestamp date;
	private String writer;
	
	public TodoList() {}
	
	public TodoList(int t_id, String todo_con, Timestamp date, String writer) {
		this.t_id = t_id;
		this.todo_con = todo_con;
		this.date = date;
		this.writer = writer;
	}
	
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getTodo_con() {
		return todo_con;
	}
	public void setTodo_con(String todo_con) {
		this.todo_con = todo_con;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
}
