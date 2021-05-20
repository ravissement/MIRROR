package com.board.domain;

import java.util.Date;

public class ApplyReplyVO {

/*	
CREATE TABLE tbl_applyreply (
	rno	 INT 	NOT  NULL  AUTO_INCREMENT,
	ano	 INT	 NOT  NULL,
	writer 	VARCHAR(30) 	NOT  NULL,
	content 	TEXT  NOT  NULL,
	regDate	 TIMESTAMP 	NOT  NULL  DEFAULT  NOW(),
	PRIMARY  KEY(rno, ano),
	FOREIGN  KEY(ano)  REFERENCES  tbl_applyQuestion(ano)  ON  UPDATE  CASCADE  ON  DELETE  CASCADE 
);

*/
	
	private int rno;
	private int ano;
	private String writer;
	private String content;
	private Date regDate;
	
	
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
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
