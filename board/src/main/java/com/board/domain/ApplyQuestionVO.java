package com.board.domain;

import java.util.Date;

public class ApplyQuestionVO {

/*
CREATE TABLE tbl_applyquestion(
 ano INT NOT NULL AUTO_INCREMENT,
 diaryMonth CHAR(2)	NOT NULL,
 diaryDay CHAR(2) NOT NULL,
 diaryQuestion VARCHAR(500)	NOT NULL,
 diaryQuestionEng VARCHAR(500) NOT NULL,
 user_id VARCHAR(30) NOT NULL,
 regDate TIMESTAMP DEFAULT NOW(),
 isUse CHAR(1) DEFAULT 1,
 questionVersion CHAR(1) DEFAULT 1,
 PRIMARY KEY(qno)
);	
*/
	private int cnt;
	private int ano;
	private int diaryMonth;
	private int diaryDay;
	private String diaryQuestion;
	private String diaryQuestionEng;
	private String user_id;
	private String user_email;
	private String user_phone;
	private Date regDate;
	private int isUse;
	private int questionVersion;
	
	
	
	
	
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
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
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getDiaryMonth() {
		return diaryMonth;
	}
	public void setDiaryMonth(int diaryMonth) {
		this.diaryMonth = diaryMonth;
	}
	public int getDiaryDay() {
		return diaryDay;
	}
	public void setDiaryDay(int diaryDay) {
		this.diaryDay = diaryDay;
	}
	public String getDiaryQuestion() {
		return diaryQuestion;
	}
	public void setDiaryQuestion(String diaryQuestion) {
		this.diaryQuestion = diaryQuestion;
	}
	public String getDiaryQuestionEng() {
		return diaryQuestionEng;
	}
	public void setDiaryQuestionEng(String diaryQuestionEng) {
		this.diaryQuestionEng = diaryQuestionEng;
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
	public int getIsUse() {
		return isUse;
	}
	public void setIsUse(int isUse) {
		this.isUse = isUse;
	}
	public int getQuestionVersion() {
		return questionVersion;
	}
	public void setQuestionVersion(int questionVersion) {
		this.questionVersion = questionVersion;
	}
	
}
