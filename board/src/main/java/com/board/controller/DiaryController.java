package com.board.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.BoardVO;
import com.board.domain.DiaryQuestionVO;
import com.board.domain.Page;
import com.board.domain.UserDiaryVO;
import com.board.service.DiaryService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/diary/*")
public class DiaryController {
	
	@Inject
	private DiaryService service;
	
	//캘린더 화면
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void getCalendar(Model model) throws Exception {
		model.addAttribute("nav", "noSearch");
	}
	
	//일기장 목록
	@RequestMapping(value = "/diaryList", method = RequestMethod.POST)
	public void postDiaryList(Model model, @RequestParam(value = "num", required = false, defaultValue =  "1") int num, 
			@RequestParam(value = "diaryMonth", required = false) String diaryMonth,
			@RequestParam(value = "diaryDay", required = false) String diaryDay,
			@RequestParam(value = "user_id", required = false) String user_id) throws Exception {
		
		//다이어리 질문 불러오기
		int version = 1;
		DiaryQuestionVO questionVO = service.diaryQuestion(diaryMonth, diaryDay, version);
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.diaryCount(diaryMonth, diaryDay, user_id));  
		
		List<UserDiaryVO> list = null;
		
		//다이어리 내용 불러오기
		list = service.diaryList(page.getDisplayPost(), page.getPostNum(), diaryMonth, diaryDay, user_id);
		
		
		model.addAttribute("diaryQuestion", questionVO);
		model.addAttribute("diaryList", list);
		model.addAttribute("nav", "noSearch");
		
	}
	
	
	//다이어리 생성 & 수정
	@ResponseBody
	@RequestMapping(value = "/diaryWrite", method = RequestMethod.POST)
	public Object postWrite(UserDiaryVO vo) throws Exception {
		
		int checkDiary = service.diaryView(vo);
		int result = 0;
		
		//수정
		if(checkDiary > 0) {
			result = service.diaryModify(vo);
			
		//생성
		}else {
			result = service.diaryWrite(vo);
			
		}
		
		
		return result;
		
		
	} 
	
}
