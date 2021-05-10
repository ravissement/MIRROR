package com.board.domain;

import java.util.Date;

public class BoardLikeVO {

/*
CREATE TABLE tbl_board_like(
	bno INT	NOT NULL,
	user_id	VARCHAR(30),
	isUseLike CHAR(1) NOT NULL,
	regDate	TIMESTAMP	DEFAULT NOW()
);
*/
	
	private int bno;
	private String user_id;
	private int isUseLike;
	private Date regDate;
	
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getIsUseLike() {
		return isUseLike;
	}
	public void setIsUseLike(int isUseLike) {
		this.isUseLike = isUseLike;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
	
}
