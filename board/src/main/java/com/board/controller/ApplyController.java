package com.board.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.ApplyQuestionVO;
import com.board.service.DiaryService;

@Controller
@RequestMapping("/apply/*")
public class ApplyController {
	
	@Inject
	private DiaryService service;
	
	//한줄참여 페이지
	@RequestMapping(value = "/apply", method = RequestMethod.GET)
	public void getApply(Model model) throws Exception {
		model.addAttribute("nav", "noSearch");
	}
	
	
	//한줄참여 페이지
	@ResponseBody
	@RequestMapping(value = "/applyQuestion", method = RequestMethod.POST)
	public Object postApplyQuestion(Model model, ApplyQuestionVO vo) throws Exception {
		
		int result = service.applyQuestion(vo);
		
		return result;
	}
}
