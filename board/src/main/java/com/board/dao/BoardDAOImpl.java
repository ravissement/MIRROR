package com.board.dao;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.BoardLikeVO;
import com.board.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.board";
	
	@Override
	public List<BoardVO> list(String user_id) throws Exception {
		
		return sql.selectList(namespace + ".list", user_id);
	}

	@Override
	public void write(BoardVO vo) throws Exception {
		
		sql.insert(namespace + ".write", vo);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		return sql.selectOne(namespace + ".view", bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		sql.update(namespace + ".modify", vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		sql.delete(namespace + ".delete", bno);
	}

	@Override
	public int count() throws Exception {
		return sql.selectOne(namespace + ".count");
	}

	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		
		HashMap<String, Integer> data = new HashMap<String, Integer>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sql.selectList(namespace + ".listPage", data);
	}

	@Override
	public List<BoardVO> listPageSerch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".listPageSearch", data);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".searchCount", data);
	}
	
	@Override
	public int userSearchCount(String searchType, String keyword, String user_id) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		data.put("user_id", user_id);
		
		return sql.selectOne(namespace + ".userCount", data);
	}

	@Override
	public List<BoardVO> userList(int displayPost, int postNum, String searchType, String keyword, String user_id)
			throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("searchType", searchType);
		data.put("keyword", keyword);
		data.put("user_id", user_id);
		
		return sql.selectList(namespace + ".userList", data);
	}

	@Override
	public int writeThumb(BoardVO vo) throws Exception {
		return sql.insert(namespace + ".writeThumb", vo);
	}

	@Override
	public int modifyThumb(BoardVO vo) throws Exception {
		return sql.update(namespace + ".modifyThumb", vo);
	}
	

	
	
	

	@Override
	public List<BoardVO> homeList(int limit) throws Exception {
		return sql.selectList(namespace + ".homeList", limit);
	}

	
	
	
	
	
	
	@Override
	public int boardLikeInsert(BoardLikeVO vo) throws Exception {
		return sql.insert(namespace + ".boardLikeInsert", vo);
	}

	@Override
	public BoardLikeVO boardLike(BoardLikeVO vo) throws Exception {
		return sql.selectOne(namespace + ".boardLike", vo);
	}

	@Override
	public int boardLikeModify(BoardLikeVO vo) throws Exception {
		return sql.update(namespace + ".boardLikeModify", vo);
	}

	
	
	
	
	
	@Override
	public List<BoardVO> bestList(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectList(namespace + ".bestList", data);
		
	}

	@Override
	public int bestCount(String searchType, String keyword) throws Exception {
		
		HashMap<String, Object> data = new HashMap<String, Object>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sql.selectOne(namespace + ".bestCount", data);
	}
	
	
	
	
	
}
