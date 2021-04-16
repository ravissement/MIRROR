package com.board.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.domain.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.board.mappers.user";
	
	@Override
	public void join(UserVO vo) throws Exception {
		sql.insert(namespace + ".join", vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne(namespace + ".login", vo);
	}

	@Override
	public int idCheck(String id) throws Exception {
		return sql.selectOne(namespace + ".idCheck", id);
	}

}
