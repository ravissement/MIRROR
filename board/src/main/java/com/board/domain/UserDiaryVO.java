package com.board.domain;

import java.util.Date;

public class UserDiaryVO {
/*
CREATE TABLE tbl_userDiary(
	dno  INT 	NOT  NULL  AUTO_INCREMENT,
	diaryYear  CHAR(4)	 NOT  NULL,
	diaryMonth  CHAR(2)	 NOT  NULL,
	diaryDay  CHAR(2)	 NOT  NULL,
	diaryAnswer  VARCHAR(200)	 NOT NULL,
	user_id	 VARCHAR(30) 	NOT  NULL,
	regDate	 TIMESTAMP	 DEFAULT  NOW(),
	isUse  CHAR(1)  DEFAULT  1,
	PRIMARY  KEY(dno)
);
COMMIT;  
 
*/

	
	private int dno;
	private String diaryYear;
	private String diaryMonth;
	private String diaryDay;
	private String diaryAnswer;
	private String user_id;
	private Date regDate;
	private int isUse;
	
	
	
	public int getIsUse() {
		return isUse;
	}
	public void setIsUse(int isUse) {
		this.isUse = isUse;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public String getDiaryYear() {
		return diaryYear;
	}
	public void setDiaryYear(String diaryYear) {
		this.diaryYear = diaryYear;
	}
	public String getDiaryMonth() {
		return diaryMonth;
	}
	public void setDiaryMonth(String diaryMonth) {
		this.diaryMonth = diaryMonth;
	}
	public String getDiaryDay() {
		return diaryDay;
	}
	public void setDiaryDay(String diaryDay) {
		this.diaryDay = diaryDay;
	}
	public String getDiaryAnswer() {
		return diaryAnswer;
	}
	public void setDiaryAnswer(String diaryAnswer) {
		this.diaryAnswer = diaryAnswer;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	
	
	
	
	
	
	
}
