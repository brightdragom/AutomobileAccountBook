package model;

public class RepairCheck {
	private int repair_no;
	private String driver_id;
	private String driver_name;
	private String technician_id;
	private String technician_name;
	private String contents;
	private String start_date;
	private String expect_date;
	private String finish_date;
	private int cost;
	
	public int getRepair_no() {
		return repair_no;
	}
	public void setRepair_no(int repair_no) {
		this.repair_no = repair_no;
	}
	public String getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}
	public String getDriver_name() {
		return driver_name;
	}
	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}
	public String getTechnician_id() {
		return technician_id;
	}
	public void setTechnician_id(String technician_id) {
		this.technician_id = technician_id;
	}
	public String getTechnician_name() {
		return technician_name;
	}
	public void setTechnician_name(String technician_name) {
		this.technician_name = technician_name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getExpect_date() {
		return expect_date;
	}
	public void setExpect_date(String expect_date) {
		this.expect_date = expect_date;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}

}