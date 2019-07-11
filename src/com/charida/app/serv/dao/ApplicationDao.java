package com.charida.app.serv.dao;

import java.util.Map;

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
	
	public int insertRow(Map<String, Object> entity) {
		return sqlSession.insert("App.insertRow", entity);
	}
}
