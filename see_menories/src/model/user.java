package model;

public class user {

	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String birth;
	private String phone;
	private String question;
	private String answer;
	private int like_num;
	private int photo_num;
	private int mylike_num;
	private String profile;
	
	
	
	public int getMylike_num() {
		return mylike_num;
	}
	public void setMylike_num(int mylike_num) {
		this.mylike_num = mylike_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public String getquestion() {
		return question;
	}
	public String getanswer() {
		return answer;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	
	
	
	
	public int getphoto_num() {
		return photo_num;
	}
	public void setphoto_num(int photo_num) {
		this.photo_num = photo_num;
	}
	
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public user() {
		super();
	}
	
	
	public user(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	public user(String phone) {
		super();
		this.phone = phone;
	}
	public user(String id,String question,String answer) {
		super();
		this.id = id;
		this.question = question;
		this.answer = answer;
	}
	public user(String name,String phone,int temp) {
		super();
		this.name = name;
		this.phone = phone;
		temp=0;
	}
	public user(String id, String pw, String name, String nickname, String birth, String phone) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
	}
	
	public user(String id, String pw, String name, String nickname, String birth, String phone, String question,String answer) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
		this.question = question;
		this.answer = answer;
	}
	
	public user(String id, String pw, String name, String nickname, String birth, String phone, String question,String answer, int like_num) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
		this.question = question;
		this.answer = answer;
		this.like_num = like_num;
	}
	
	public user(String id, String pw, String name, String nickname, String birth, String phone, String question,String answer, int like_num,String profile) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
		this.like_num = like_num;
		this.question = question;
		this.answer = answer;
		this.profile = profile;
	}
	public user(String id, String pw, String name, String nickname, String birth, String phone,String profile) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
		this.profile = profile;
	}
	
	public user(String id, String pw, String name, String nickname, String birth, String phone, int like_num,
			int photo_num) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.phone = phone;
		this.like_num = like_num;
		this.photo_num = photo_num;
	}
	
	@Override
	public String toString() {
		return " [id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname + ", birth=" + birth
				+ ", phone=" + phone + ", question=" + question + ", answer="+ answer +", like_num=" + like_num + ", photo_num=" + photo_num + "]";
	}
	
	
	
	
	
	
	
	
}
