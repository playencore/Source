package com.charida.app.serv.dao;

import java.util.List;
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
	
	public int insertRow(Map<String, Object> datas) {
		return sqlSession.insert("App.insertRow", datas);
	}
	
	public List<String> selectPrefList(String servId){
		return sqlSession.selectList("App.selectPrefList", servId);
	}
	
	public List<String> selectAddOrderList(String servId){
		return sqlSession.selectList("App.selectAddOrderList", servId);
	}
	public int updateProgress(Map<String,String> datas) {
		return sqlSession.update("App.updateProgress", datas);
	}
	public List<Map<String, Object>> getPayList(Map<String, Object> param){
		return sqlSession.selectList("App.getPayList", param);
	}
	public int getPayListCount(String memId){
		return sqlSession.selectOne("App.getPayListCount", memId);
	}
}
