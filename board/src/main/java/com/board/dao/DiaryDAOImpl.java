package com.board.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.ApplyQuestionVO;
import com.board.domain.DiaryQuestionVO;
import com.board.domain.UserDiaryVO;

@Repository
public class DiaryDAOImpl implements DiaryDAO {
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.diary";

	@Override
	public List<UserDiaryVO> diaryList(int displayPost, int postNum, String diaryMonth, String diaryDay, String user_id) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("diaryMonth", diaryMonth);
		data.put("diaryDay", diaryDay);
		data.put("user_id", user_id);
		
		
		return sql.selectList(namespace + ".list", data);
	}

	@Override
	public int diaryCount(String diaryMonth, String diaryDay, String user_id) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("diaryMonth", diaryMonth);
		data.put("diaryDay", diaryDay);
		data.put("user_id", user_id);
		
		return sql.selectOne(namespace + ".diaryCount", data);
	}

	@Override
	public DiaryQuestionVO diaryQuestion(String diaryMonth, String diaryDay, int version) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("diaryMonth", diaryMonth);
		data.put("diaryDay", diaryDay);
		data.put("version", version);

		
		return sql.selectOne(namespace + ".diaryQuestion", data);
	}

	@Override
	public int diaryWrite(UserDiaryVO vo) throws Exception {
		
		return sql.insert(namespace + ".diaryWrite", vo);
	}

	@Override
	public int diaryView(UserDiaryVO vo) throws Exception {
		return sql.selectOne(namespace + ".diaryView", vo);
	}

	@Override
	public int diaryModify(UserDiaryVO vo) throws Exception {
		return sql.update(namespace + ".diaryModify", vo);
	}

	@Override
	public int applyQuestion(ApplyQuestionVO vo) throws Exception {
		return sql.insert(namespace + ".applyQuestion", vo);
	}

	@Override
	public List<ApplyQuestionVO> applyList(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".applyList", data);
	}

	@Override
	public int applyListCount(String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();

		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".applyListCount", data);
	}

	@Override
	public List<DiaryQuestionVO> applyCalendar(String diaryMonth) throws Exception {
		return sql.selectList(namespace + ".applyCalendar", diaryMonth);
	}
	
	
	
	
}
