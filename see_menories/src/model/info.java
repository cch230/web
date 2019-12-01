package model;

import java.sql.Time;
import java.util.Arrays;

public class info {
	private int id;
	private String title;
	private String tag;
	private String user_id;
	private String user_name;
	private String location;
	private String content;
	private int like_num;
	private String[] info;
	
	
	private String reg_Date;
	private int comment_num;
	
	
	
	public info() {
		super();
	}
	
	public info(String title,String tag, String location, String content, int like_num, String[] info) {
		super();
		this.title = title;
		this.tag= tag;
		this.location = location;
		this.content = content;
		this.like_num = like_num;
		this.info = info;
	}
	public info(int id,String title, String location, String content, int like_num, String[] info) {
		super();
		this.id = id;
		this.title = title;
		this.location = location;
		this.content = content;
		this.like_num = like_num;
		this.info = info;
	}

	public info(int id,String title, String tag, String location,String content, int like_num, String[] info,String reg_Date) {
		super();
		this.id = id;
		this.title = title;
		this.tag= tag;
		this.location = location;
		this.content = content;
		this.like_num = like_num;
		this.info = info;
		this.reg_Date = reg_Date;
		
	}
	public info(int id, String title, String location, String content, int like_num, String reg_Date) {
		super();
		this.id = id;
		this.title = title;
		this.location = location;
		this.content = content;
		this.like_num = like_num;
		this.reg_Date = reg_Date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	
	public String getuser_id() {
		return user_id;
	}

	public void setuser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getuser_name() {
		return user_name;
	}



	public void setuser_name(String user_id) {
		this.user_name = user_id;
	}



	

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public String getReg_Date() {
		return reg_Date;
	}
	public void setReg_Date(String string) {
		this.reg_Date = string;
	}

	public String[] getinfo() {
		return info;
	}






	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public void setinfo(String[] info) {
		this.info=info;
	}






	@Override
	public String toString() {
		return "info [id=" + id + ", title=" + title + ", user_name=" + user_name + ", location=" + location
				+ ", content=" + content + ", like_num=" + like_num + ", info=" + Arrays.toString(info)
				+ ", reg_Date=" + reg_Date + "]";
	}



	

}
