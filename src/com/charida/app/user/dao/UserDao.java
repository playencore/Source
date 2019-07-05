package com.charida.app.user.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {
	@Resource
	SqlSession sqlSession;
	
	public int countId(String id) {
		return sqlSession.selectOne("Test.countId",id);
	}
	
	public String checkPasswd(String id) {
		return sqlSession.selectOne("Test.checkPasswd",id);
	}
}





