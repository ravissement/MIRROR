package com.board.dao;


import com.board.domain.UserVO;

public interface UserDAO {
			
	//회원가입	
	public void join(UserVO vo) throws Exception;
		
	//로그인 
	public UserVO login(UserVO vo) throws Exception;
	
	//중복아이디 체크
	public int idCheck(String id) throws Exception;
	
	//썸네일
	public void thumbnail(UserVO vo) throws Exception;
}
