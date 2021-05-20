package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.ApplyReplyVO;
import com.board.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.reply";
	
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return sql.selectList(namespace + ".replyList", bno);
	}

	@Override
	public void write(ReplyVO vo) throws Exception {
		sql.insert(namespace + ".replyWrite", vo);
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		sql.update(namespace + ".replyModify", vo);
	}

	@Override
	public void delete(ReplyVO vo) throws Exception {
		sql.delete(namespace + ".replyDelete", vo);
	}

	@Override
	public List<ApplyReplyVO> applyList(int ano) throws Exception {
		return sql.selectList(namespace + ".applyReplyList", ano);
	}

	@Override
	public void applyWrite(ApplyReplyVO vo) throws Exception {
		sql.insert(namespace + ".applyReplyWrite", vo);
	}

	@Override
	public void applyModify(ApplyReplyVO vo) throws Exception {
		sql.update(namespace + ".applyReplyModify", vo);
		
	}

	@Override
	public void applyDelete(ApplyReplyVO vo) throws Exception {
		sql.delete(namespace + ".applyReplyDelete", vo);
		
	}

	
	
}
