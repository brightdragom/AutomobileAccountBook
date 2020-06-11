package model;

public class RepairCheck {
	private int maintence_no;
	private String driver_name;
	private String driver_id;
	private String techician_name;
	private String techician_id;
	private String title;
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	private String contents;
	private String start_date;
	private String expect_date;
	private String finish_date;
	private int cost;

	public RepairCheck(String driver_name, String driver_id, String techician_name, String techician_id,
			int maintence_no, String contents, String start_date, String expect_date, String finish_date, int cost) {
		this.driver_name = driver_name;
		this.driver_id = driver_id;
		this.techician_id = techician_id;
		this.maintence_no = maintence_no;
		this.contents = contents;
		this.start_date = start_date;
		this.expect_date = expect_date;
		this.finish_date = finish_date;
		this.cost = cost;
	}

	public RepairCheck() {
		// TODO Auto-generated constructor stub
	}

	public String getDriver_name() {
		return driver_name;
	}

	public void setDriver_name(String driver_name) {
		this.driver_name = driver_name;
	}

	public String getDriver_id() {
		return driver_id;
	}

	public void setDriver_id(String driver_id) {
		this.driver_id = driver_id;
	}

	public String getTechician_name() {
		return techician_name;
	}

	public void setTechician_name(String techician_name) {
		this.techician_name = techician_name;
	}

	public String getTechician_id() {
		return techician_id;
	}

	public void setTechician_id(String techician_id) {
		this.techician_id = techician_id;
	}

	public int getMaintence_no() {
		return maintence_no;
	}

	public void setMaintence_no(int maintence_no) {
		this.maintence_no = maintence_no;
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