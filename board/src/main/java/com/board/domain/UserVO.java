package com.board.domain;

import java.util.Date;

public class UserVO {

	/*
	 CREATE TABLE tbl_user(
	uno INT	NOT NULL AUTO_INCREMENT,
	user_id VARCHAR(50)	NOT NULL,
	user_pw	BLOB 	NOT NULL,
	user_name VARCHAR(20)	NOT NULL,
	user_phone	BLOB 	NOT NULL,
	user_email	BLOB 	NOT NULL,
	regDate	TIMESTAMP	DEFAULT NOW()
	PRIMARY KEY(uno)
	);
	COMMIT;  
	 */
	
	private int uno;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_email;
	private Date regDate;
	
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
}
