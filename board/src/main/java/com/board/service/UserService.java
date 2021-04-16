package com.board.service;

import com.board.domain.UserVO;

public interface UserService {
	
	//회원가입
	public void join(UserVO vo) throws Exception;
	
	
	//로그인
	public UserVO login(UserVO vo) throws Exception;
	
	//로그인
	public int idCheck(String id) throws Exception;
	
}
