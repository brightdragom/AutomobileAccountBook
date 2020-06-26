package model;

public class Repair {
	private int repair_no;
	private String contents;
	private String doday;
	private String Writer_id;
	private String img;

	public Repair(int repair_no, String contents, String doday, String writer_id, String img) {
		super();
		this.repair_no = repair_no;
		this.contents = contents;
		this.doday = doday;
		Writer_id = writer_id;
		this.img = img;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getRepair_no() {
		return repair_no;
	}

	public void setRepair_no(int repair_no) {
		this.repair_no = repair_no;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getDoday() {
		return doday;
	}

	public void setDoday(String doday) {
		this.doday = doday;
	}

	public String getWriter_id() {
		return Writer_id;
	}

	public void setWriter_id(String writer_id) {
		Writer_id = writer_id;
	}
}
