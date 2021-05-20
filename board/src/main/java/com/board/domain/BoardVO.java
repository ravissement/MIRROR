package com.board.domain;

import java.util.Date;


public class BoardVO {
/*
CREATE TABLE tbl_board(
	bno  INT 	NOT  NULL AUTO_INCREMENT,
	title  VARCHAR(50)	NOT NULL,
	subTtitle  VARCHAR(50)	NOT NULL,
	content  TEXT	NOT NULL,
	writer	 VARCHAR(30)	NOT NULL,
	regDate	 TIMESTAMP  	DEFAULT NOW(),
	viewCnt	 INT    	DEFAULT 0,
	boardThumbnail varchar(300),
	ori_boardThumbnail varchar(300),
	PRIMARY  KEY(bno)
);
COMMIT;  
 
*/
	private int likeCnt;
	private int cnt;
	private int bno;
	private String title;
	private String subTitle;
	private String content;
	private String writer;
	private String boardThumbnail;
	private String ori_boardThumbnail;
	private Date regDate;
	private int viewCnt;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getSubTitle() {
		return subTitle;
	}
	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	public String getBoardThumbnail() {
		return boardThumbnail;
	}
	public void setBoardThumbnail(String boardThumbnail) {
		this.boardThumbnail = boardThumbnail;
	}
	public String getOri_boardThumbnail() {
		return ori_boardThumbnail;
	}
	public void setOri_boardThumbnail(String ori_boardThumbnail) {
		this.ori_boardThumbnail = ori_boardThumbnail;
	}
	public int getLikeCnt() {
		return likeCnt;
	}
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	
}
