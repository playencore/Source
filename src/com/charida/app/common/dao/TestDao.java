package com.charida.app.common.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class TestDao {
	@Resource
	SqlSession sqlSession;
	
	public int selectMember() {
		return sqlSession.selectOne("Test.selectTest");
	}
	
	/*
	 * public void getInsert() { sqlSession.selectOne("Test.selectTest");
	 * 
	 * sqlSession.selectOne("Test.updateTest");
	 * sqlSession.selectOne("Test.updateTest2"); }
	 */
}
