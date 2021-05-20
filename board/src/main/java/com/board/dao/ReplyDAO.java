package com.board.dao;

import java.util.List;

import com.board.domain.ApplyReplyVO;
import com.board.domain.ReplyVO;

public interface ReplyDAO {
	// 댓글 조회
	public List<ReplyVO> list(int bno) throws Exception;

	// 댓글 작성
	public void write(ReplyVO vo) throws Exception;

	// 댓글 수정
	public void modify(ReplyVO vo) throws Exception;

	// 댓글 삭제
	public void delete(ReplyVO vo) throws Exception;
	
	
	
	/* 한줄 질문 */ 
	
	// 댓글 조회
	public List<ApplyReplyVO> applyList(int ano) throws Exception;

	// 댓글 작성
	public void applyWrite(ApplyReplyVO vo) throws Exception;

	// 댓글 수정
	public void applyModify(ApplyReplyVO vo) throws Exception;

	// 댓글 삭제
	public void applyDelete(ApplyReplyVO vo) throws Exception;
}
