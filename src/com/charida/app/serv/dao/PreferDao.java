package com.charida.app.serv.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;

@Repository
public class PreferDao extends CommonDao{

	public int insertRow(Map<String, Object> params) {
		return sqlSession.insert("Prefer.insertRow", params);
	}
}
