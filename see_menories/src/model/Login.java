package model;


public class Login {
	private String id, pw;
	private user user;
	private NaverResponse naver;
	
	private Login(LoginBuilder build) {
		this.id = build.id;
		this.pw = build.pw;
		this.user = build.user;
		this.naver = build.naver;
	}

	public static class LoginBuilder {
		private String id, pw;
		private user user;
		private NaverResponse naver;
		
		public LoginBuilder setId(String id) {
			this.id = id;
			return this;
		}
		public LoginBuilder setPw(String pw) {
			this.pw = pw;
			return this;
		}
		
		public LoginBuilder setNaver(NaverResponse naver) {
			this.naver = naver;
			return this;
		}
		
		public LoginBuilder setuser(user user) {
			this.user = user;
			return this;
		}

		public Login build() {
			return new Login(this);
		}
	}

	public user getuser() {
		return user;
	}

	public NaverResponse getNaver() {
		return naver;
	}
	
	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

}
