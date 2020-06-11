package model;

import java.util.Date;

public class AutoAccountList {
	private String line_no;
	private String todate;
	private String content;
	private int cost;
	private int mileage;
	private String writer;
	
	public AutoAccountList(String line_no, String todate, String content, int cost, int mileage, String writer) {
		this.line_no = line_no;
		this.todate = todate;
		this.content = content;
		this.cost = cost;
		this.mileage = mileage;
		this.writer = writer;
	}
	
	public AutoAccountList() {
		// TODO Auto-generated constructor stub
	}

	public String getLine_no() {
		return line_no;
	}
	public void setLine_no(String line_no) {
		this.line_no = line_no;
	}
	public String getTodate() {
		return todate;
	}
	public void setTodate(String todate) {
		this.todate = todate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	
}
