package com.board.dao;
import java.util.List;
import com.board.domain.BoardVO;

public interface BoardDAO {
	
	//게시물 목록
	public List<BoardVO> list(String user_id) throws Exception;
	
	//게시물 작성
	public void write(BoardVO vo) throws Exception;

	//게시물 작성(썸네일 포함)
	public int writeThumb(BoardVO vo) throws Exception;

	//게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	//게시물 수정
	public void modify(BoardVO vo) throws Exception;

	//게시물 삭제
	public void delete(int bno) throws Exception;
	
	//게시물 총 갯수
	public int count() throws Exception;
	
	//게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	//게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSerch(
			int displayPost, int postNum, String searchType, String keyword) throws Exception;
	
	//게시물 목록 + 페이징 + 검색 + 유저 개인
	public List<BoardVO> userList(
			int displayPost, int postNum, String searchType, String keyword, String user_id) throws Exception;
	
	//게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;
	
	//게시물 총 갯수 + 검색 적용 + 유저 개인
	public int userSearchCount(String searchType, String keyword, String user_id) throws Exception;
	
	//썸네일 수정
	public int modifyThumb(BoardVO vo) throws Exception;
	
	
	
	//홈 리스트
	public List<BoardVO> homeList(int limit) throws Exception;
}
