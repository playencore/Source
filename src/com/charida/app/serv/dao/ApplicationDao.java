package com.charida.app.serv.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ApplicationDao {
	@Resource
	private SqlSession sqlSession;

	public String SelectServId(String idPrefix) {
		return sqlSession.selectOne("App.selectServId",idPrefix);
	}
}
