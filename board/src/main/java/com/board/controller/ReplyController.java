package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.board.domain.ReplyVO;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	@Inject
	private ReplyService replyService;
	
	
	//댓글 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(ReplyVO vo) throws Exception {
		
		replyService.write(vo);
		
		return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	//댓글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(ReplyVO vo) throws Exception {
		
		replyService.delete(vo);
		
		return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	//댓글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String getModify(ReplyVO vo) throws Exception {
		
		replyService.modify(vo);
		
		return "redirect:/board/view?bno=" + vo.getBno();
	}
	
}
