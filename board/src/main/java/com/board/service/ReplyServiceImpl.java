package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.ReplyDAO;
import com.board.domain.ApplyReplyVO;
import com.board.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyVO> list(int bno) throws Exception {
		return dao.list(bno);
	}

	@Override
	public void write(ReplyVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public void modify(ReplyVO vo) throws Exception {
		dao.modify(vo);
	}

	@Override
	public void delete(ReplyVO vo) throws Exception {
		dao.delete(vo);
	}

	@Override
	public List<ApplyReplyVO> applyList(int ano) throws Exception {
		return dao.applyList(ano);
	}

	@Override
	public void applyWrite(ApplyReplyVO vo) throws Exception {
		dao.applyWrite(vo);
	}

	@Override
	public void applyModify(ApplyReplyVO vo) throws Exception {
		dao.applyModify(vo);
	}

	@Override
	public void applyDelete(ApplyReplyVO vo) throws Exception {
		dao.applyDelete(vo);
	}

}
