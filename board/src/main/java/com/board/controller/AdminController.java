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
import com.board.domain.DiaryQuestionVO;
import com.board.domain.Page;
import com.board.service.DiaryService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	
	@Inject
	private DiaryService service;
	
	//한줄참여관리 페이지
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
	}
	
	
	//한줄참여 페이지
	@ResponseBody
	@RequestMapping(value = "/applyQuestion", method = RequestMethod.POST)
	public Object postApplyQuestion(Model model, ApplyQuestionVO vo) throws Exception {
		
		int result = service.applyQuestion(vo);
		
		return result;
	}
	
	//한줄참여 캘린더
	@ResponseBody
	@RequestMapping(value = "/applyCalendar", method = RequestMethod.POST)
	public Object postApplyCalendar(Model model, String diaryMonth) throws Exception {
		
		
		List<DiaryQuestionVO> list = null;
		
		list = service.applyCalendar(diaryMonth);
		
		return list;
	}
	
	
}
