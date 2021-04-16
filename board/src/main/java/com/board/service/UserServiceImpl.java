package com.board.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.UserDAO;
import com.board.domain.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject UserDAO dao;
	
	@Override
	public void join(UserVO vo) throws Exception {
		dao.join(vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return dao.idCheck(id);
	}

	@Override
	public void thumbnail(UserVO vo) throws Exception {
		dao.thumbnail(vo);
	}

}
