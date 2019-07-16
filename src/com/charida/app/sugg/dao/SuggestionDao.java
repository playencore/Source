package com.charida.app.sugg.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;

@Repository
public class SuggestionDao extends CommonDao{
	
	public List<Map<String, Object>> getSuggList(String suggId){
		return sqlSession.selectList("Sugg.getSuggList", suggId);
	}
	
	public List<Map<String, Object>> getSuggMenuInfo(String suggId){
		return sqlSession.selectList("Sugg.getSuggMenuInfo", suggId);
	}
	
	public Map<String, Object> getSuggInfo(String suggId){
		return sqlSession.selectOne("Sugg.getSuggInfo", suggId);
	}
}
