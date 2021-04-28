package com.board.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.service.BoardService;

@Controller
public class HomeController {
	
	@Inject
	private BoardService service;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, @RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		System.out.println(keyword);
		
		if(keyword.equals("")) {
			int limit = 3;
			List<BoardVO> homeList = null;
			homeList = service.homeList(limit);
			
			model.addAttribute("homeList", homeList);
			
			return "home";
		}else {
			return "redirect:board/homeList?num=1&keyword="+keyword;
		}
			
		
	}
	

	
}
