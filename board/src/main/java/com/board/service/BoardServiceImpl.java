package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.domain.BoardLikeVO;
import com.board.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;
	
	//게시물 목록
	@Override
	public List<BoardVO> list(String user_id) throws Exception {
		return dao.list(user_id);
	}
	
	//게시물 작성
	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		return dao.view(bno);
	}

	@Override
	public void modify(BoardVO vo) throws Exception {
		dao.modify(vo);
		
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public int count() throws Exception {
		return dao.count();
	}

	@Override
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception {
		return dao.listPage(displayPost, postNum);
	}

	@Override
	public List<BoardVO> listPageSearch(int displayPost, int postNum, String searchType, String keyword)
			throws Exception {
		return dao.listPageSerch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) throws Exception {
		return dao.searchCount(searchType, keyword);
	}

	@Override
	public int userSearchCount(String searchType, String keyword, String user_id) throws Exception {
		return dao.userSearchCount(searchType, keyword, user_id);
	}

	@Override
	public List<BoardVO> userList(int displayPost, int postNum, String searchType, String keyword, String user_id)
			throws Exception {
		return dao.userList(displayPost, postNum, searchType, keyword, user_id);
	}

	@Override
	public int modifyThumb(BoardVO vo) throws Exception {
		return dao.modifyThumb(vo);
	}

	@Override
	public int writeThumb(BoardVO vo) throws Exception {
		return dao.writeThumb(vo);
	}
	
	
	
	
	//MAIN PAGE

	@Override
	public List<BoardVO> homeList(int limit) throws Exception {
		return dao.homeList(limit);
	}


	
	
	//좋아요 기능
	
	@Override
	public int boardLikeInsert(BoardLikeVO vo) throws Exception {
		return dao.boardLikeInsert(vo);
	}

	@Override
	public BoardLikeVO boardLike(BoardLikeVO vo) throws Exception {
		return dao.boardLike(vo);
	}

	@Override
	public int boardLikeModify(BoardLikeVO vo) throws Exception {
		return dao.boardLikeModify(vo);
	}

	
	
	//베스트 글
	
	@Override
	public List<BoardVO> bestList(int displayPost, int postNum, String searchType, String keyword) throws Exception {
		return dao.bestList(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int bestCount(String searchType, String keyword) throws Exception {
		return dao.bestCount(searchType, keyword);
	}


	
	
}
