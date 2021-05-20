package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.DiaryDAO;
import com.board.domain.ApplyQuestionVO;
import com.board.domain.DiaryQuestionVO;
import com.board.domain.UserDiaryVO;

@Service
public class DiaryServiceImpl implements DiaryService {
	
	@Inject
	private DiaryDAO dao;
	
	
	@Override
	public List<UserDiaryVO> diaryList(int displayPost, int postNum, String diaryMonth, String diaryDay, String user_id) throws Exception {
		
		
		return dao.diaryList(displayPost, postNum, diaryMonth, diaryDay, user_id);
	}


	@Override
	public int diaryCount(String diaryMonth, String diaryDay, String user_id) throws Exception {
		return dao.diaryCount(diaryMonth, diaryDay, user_id);
	}


	@Override
	public DiaryQuestionVO diaryQuestion(String diaryMonth, String diaryDay, int version) throws Exception {
		return dao.diaryQuestion(diaryMonth, diaryDay, version);
	}


	@Override
	public int diaryWrite(UserDiaryVO vo) throws Exception {
		return dao.diaryWrite(vo);
	}


	@Override
	public int diaryView(UserDiaryVO vo) throws Exception {
		return dao.diaryView(vo);
	}


	@Override
	public int diaryModify(UserDiaryVO vo) throws Exception {
		return dao.diaryModify(vo);
	}


	@Override
	public int applyQuestion(ApplyQuestionVO vo) throws Exception {
		return dao.applyQuestion(vo);
	}


	@Override
	public List<ApplyQuestionVO> applyList(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		return dao.applyList(displayPost, postNum, searchType, keyword);
	}


	@Override
	public int applyListCount(String searchType, String keyword) throws Exception {
		return dao.applyListCount(searchType, keyword);
	}

	@Override
	public List<DiaryQuestionVO> applyCalendar(String diaryMonth) throws Exception {
		return dao.applyCalendar(diaryMonth);
	}


	@Override
	public int adminApplyQuestion(ApplyQuestionVO vo) throws Exception {
		return dao.adminApplyQuestion(vo);
	}


	@Override
	public ApplyQuestionVO view(int ano) throws Exception {
		return dao.view(ano);
	}

}
