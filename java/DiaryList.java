package UserDiary;

import java.sql.Date;

public class DiaryList {
	public int id;
	private String title;
	private String content;
	private int year;
	private int month;
	private int day;
	private String writer;
	private Date date;
	private int rn;
	
	public DiaryList() {}
	
	public DiaryList(int id,String title, String content, Date date, String writer) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.date = date;
		this.writer = writer;
	}
	public int getRn() {
		return rn;
	}
	public void setRn(int rn, int i) {
		this.rn = rn+i;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public void setDate(int year,int month, int day) {
		String date_s = year+"-"+month+"-"+day;
		Date date = Date.valueOf(date_s);
		this.date = date;
	}
	public Date getDate() {
		return date;
	}

}
