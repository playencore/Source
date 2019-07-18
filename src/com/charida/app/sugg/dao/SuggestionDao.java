package com.charida.app.sugg.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;

@Repository
public class SuggestionDao extends CommonDao{
	
	public List<Map<String, Object>> getSuggList(Map<String, Object> param){
		return sqlSession.selectList("Sugg.getSuggList", param);
	}
	public int getSuggListCount(String suggId){
		return sqlSession.selectOne("Sugg.getSuggListCount", suggId);
	}
	
	public List<Map<String, Object>> getSuggMenuInfo(String suggId){
		return sqlSession.selectList("Sugg.getSuggMenuInfo", suggId);
	}
	public List<Map<String, Object>> getWaitList(Map<String, Object> param){
		return sqlSession.selectList("Sugg.getWaitList", param);
	}
	public int getWaitListCount(String memId){
		return sqlSession.selectOne("Sugg.getWaitListCount", memId);
	}
	
	public List<Map<String, Object>> getPreparingList(Map<String, Object> param){
		return sqlSession.selectList("Sugg.getPreparingList", param);
	}
	public int getPreparingListCount(String memId){
		return sqlSession.selectOne("Sugg.getPreparingListCount", memId);
	}
	public List<Map<String, Object>> getShippingList(Map<String, Object> param){
		return sqlSession.selectList("Sugg.getShippingList", param);
	}
	public int getShippingListCount(String memId){
		return sqlSession.selectOne("Sugg.getShippingListCount", memId);
	}
	
	public Map<String, Object> getSuggInfo(String suggId){
		return sqlSession.selectOne("Sugg.getSuggInfo", suggId);
	}
}
