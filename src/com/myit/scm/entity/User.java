package com.myit.scm.entity;

public class User {
	
	private int userId;//用户ID
	private String userName;//用户名称，也是登录账号
	private String password;//用户密码
	private boolean permission;//用户是否注册
	private String address;//用户地址
	private String phone;//用户联系电话
	private String email;//用户邮箱
	private String realName;//用户真实姓名
	private String IdNum;//用户的身份证
	
	public User() {
		super();
	}

	public User(String userName, String password) {
		super();
		this.userName = userName;
		this.password = password;
	}

	public User(String userName, String password, boolean permission) {
		super();
		this.userName = userName;
		this.password = password;
		this.permission = permission;
	}


	public User(int userId, String userName, String password, boolean permission) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.password = password;
		this.permission = permission;
	}

	public int getuserId() {
		return userId;
	}

	public void setuserId(int userId) {
		this.userId = userId;
	}

	public String getuserName() {
		return userName;
	}

	public void setuserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getPermission() {
		return permission;
	}

	public void setPermission(boolean permission) {
		this.permission = permission;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getIdNum() {
		return IdNum;
	}

	public void setIdNum(String idNum) {
		IdNum = idNum;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", password=" + password + ", permission="
				+ permission + ", address=" + address + ", phone=" + phone + ", email=" + email + ", realName="
				+ realName + ", IdNum=" + IdNum + "]";
	}

	
	
	
}
