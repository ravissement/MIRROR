package com.board.domain;

import java.util.Date;

public class ReplyVO {
	/*
 	CREATE TABLE tbl_reply (
	rno	INT	NOT NULL AUTO_INCREMENT,
	bno	INT	NOT NULL,
	writer	VARCHAR(30)	NOT NULL,
	content	TEXT			NOT NULL,
	regDate	TIMESTAMP	NOT NULL DEFAULT NOW(),
	PRIMARY KEY(rno, bno),
	FOREIGN KEY(bno) REFERENCES tbl_board(bno) ON UPDATE CASCADE ON DELETE CASCADE 
	); 
	*/
	
	private int rno;
	private int bno;
	private String writer;
	private String content;
	private Date regDate;
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	

}
