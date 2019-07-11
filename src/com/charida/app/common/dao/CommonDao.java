package com.charida.app.common.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;

public abstract class CommonDao {
	@Resource
	protected SqlSession sqlSession;
}
