package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.UserVO;
import com.board.service.UserService;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Inject UserService service;
	
	
	//회원가입 작성
	@RequestMapping(value ="/write", method = RequestMethod.GET)
	public void getWrite(Model model) throws Exception {
		model.addAttribute("nav", "noSearch");
	}
	
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String getJoin(UserVO vo, Model model) throws Exception {
		
		service.join(vo);
		model.addAttribute("userJoinName", vo.getUser_name());
		
		return "home";
	}
	
	
	//로그인 작성
	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public void getLogin(Model model) throws Exception {
		model.addAttribute("nav", "noSearch");
	}
	
	
	//로그인
	@RequestMapping(value = "/goLogin", method = RequestMethod.POST)
	public String getLogin(UserVO vo, HttpServletRequest req, Model model) throws Exception {
		
		HttpSession session = req.getSession();
		UserVO login = service.login(vo);
		String url = "";
		if(login == null) {
			session.setAttribute("member", null);
			model.addAttribute("loginResult", "X");
			url = "/user/login";
		} else {
			session.setAttribute("member", login);
			url = "home";
		}
		
		return url;
	}
		
	//로그아웃
	@RequestMapping(value ="/logout", method = RequestMethod.GET)
	public String getLoout(HttpServletRequest req) throws Exception {

		HttpSession session = req.getSession();
		session.removeAttribute("member");
		
		return "home";
	}
	
	//아이디 중복 체크
	@ResponseBody
	@RequestMapping(value ="/idCheck", method = RequestMethod.POST)
	public String getIdCheck(String user_id) throws Exception {
		int result = service.idCheck(user_id); 
		
		if (result == 0) {
			return "Y";
		}else {
			return "N";
		}
		
		
	}
	
		
}
	
