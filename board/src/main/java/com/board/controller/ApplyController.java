package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.ApplyQuestionVO;
import com.board.domain.ApplyReplyVO;
import com.board.domain.BoardLikeVO;
import com.board.domain.Page;
import com.board.service.DiaryService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/apply/*")
public class ApplyController {
	
	@Inject
	private DiaryService service;
	
	@Inject
	private ReplyService replyService;
	
	//한줄참여 페이지
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public void getApply(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType", required = false, defaultValue = "") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.applyListCount(searchType, keyword));  
		
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		
		List<ApplyQuestionVO> list = null;
		list = service.applyList(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
		
		model.addAttribute("nav", "noSearch");
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		model.addAttribute("applyList", list);
		
		model.addAttribute("nav", "noSearch");
	}
	
	
	//게시물 조회
	@RequestMapping(value="/view", method = RequestMethod.GET)
	public void getView(@RequestParam("ano") int ano, Model model) throws Exception {
		
		ApplyQuestionVO vo = service.view(ano);
		model.addAttribute("view", vo);
		model.addAttribute("nav", "noSearch");
		
		//댓글 조회
		List<ApplyReplyVO> reply = null;
		reply = replyService.applyList(ano);
		model.addAttribute("reply", reply);
		
		
		
	}
	
	
	//한줄참여 페이지
	@ResponseBody
	@RequestMapping(value = "/applyQuestion", method = RequestMethod.POST)
	public Object postApplyQuestion(Model model, ApplyQuestionVO vo) throws Exception {
		
		int result = service.applyQuestion(vo);
		
		return result;
	}
}
