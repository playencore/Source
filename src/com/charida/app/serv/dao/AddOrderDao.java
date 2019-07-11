package com.charida.app.serv.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class AddOrderDao {
	@Resource
	private SqlSession sqlSession;
	
	public int insertRow(Map<String, Object> params) {
		return sqlSession.insert("Order.insertRow", params);
	}
	
	
}
