package model;

public class Comment {
	
	private int id;
	private int photo_id;
	private String user_id;
	private String user_name;
	private String comment;
	private String reg_date;
	
	
	
	public Comment(int photo_id, String user_id, String user_name, String comment) {
		super();
		this.photo_id = photo_id;
		this.user_id = user_id;
		this.user_name = user_name;
		this.comment = comment;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getuser_name() {
		return user_name;
	}



	public void setuser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getReg_date() {
		return reg_date;
	}



	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}



	public int getphoto_id() {
		return photo_id;
	}



	public void setphoto_id(int photo_id) {
		this.photo_id = photo_id;
	}



	public String getuser_id() {
		return user_id;
	}



	public void setuser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getComment() {
		return comment;
	}



	public void setComment(String comment) {
		this.comment = comment;
	}



	public Comment() {
		super();
	}



	public Comment(int photo_id, String user_id, String comment) {
		super();
		this.photo_id = photo_id;
		this.user_id = user_id;
		this.comment = comment;
	}



	@Override
	public String toString() {
		return "Comment [photo_id=" + photo_id + ", user_id=" + user_id + ", comment=" + comment + "]";
	}
	
	

}
