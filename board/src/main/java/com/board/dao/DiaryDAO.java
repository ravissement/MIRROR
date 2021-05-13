package com.board.dao;

import java.util.List;

import com.board.domain.ApplyQuestionVO;
import com.board.domain.DiaryQuestionVO;
import com.board.domain.UserDiaryVO;

public interface DiaryDAO {

	
	//다이어리 조회
	public List<UserDiaryVO> diaryList(int displayPost, int postNum, String diaryMonth, String diaryDay, String user_id) throws Exception;
	
	
	//다이어리 총갯수
	public int diaryCount(String diaryMonth, String diaryDay, String user_id) throws Exception;
	
	
	//다이어리 question
	public DiaryQuestionVO diaryQuestion(String diaryMonth, String diaryDay, int version) throws Exception;
	
	
	//다이어리 저장여부 확인
	public int diaryView(UserDiaryVO vo) throws Exception;
	
	//다이어리 저장
	public int diaryWrite(UserDiaryVO vo) throws Exception;
	
	//다이어리 수정
	public int diaryModify(UserDiaryVO vo) throws Exception;
	
	//한줄질문 참여
	public int applyQuestion(ApplyQuestionVO vo) throws Exception;
	
	
	//한줄질문 리스트
	public List<ApplyQuestionVO> applyList(int displayPost, int postNum, String searchType, String keyword) throws Exception; 
	

	//한줄질문 카운트
	public int applyListCount(String searchType, String keyword) throws Exception;
	
	
	//다이어리 캘린더
	public List<DiaryQuestionVO> applyCalendar(String diaryMonth) throws Exception;
	
}
