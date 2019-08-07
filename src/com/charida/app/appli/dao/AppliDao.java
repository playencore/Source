package com.charida.app.appli.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;
import com.charida.app.common.service.TestService;

@Repository
public class AppliDao extends CommonDao{
	protected Log log = LogFactory.getLog(TestService.class);
	public List<Map<String, Object>> getAppliList(Map<String, Object> param){
		log.debug("param : " + param);
		return sqlSession.selectList("Appli.getAppliList", param);
	}
	public int getAppliListCount(String appliId) {
		return sqlSession.selectOne("Appli.getAppliListCount", appliId);
	}
	public Map<String, Object> getAppliInfo(String appliId){
		return sqlSession.selectOne("Appli.getAppliInfo", appliId);
	}
	public List<Map<String, Object>> getSuggInfo(String appliId){
		return sqlSession.selectList("Appli.getSuggInfo", appliId);
	}
	public int setSuggState(String suggId){
		log.debug("setSuggState >> suggId : " + suggId);
		return sqlSession.update("Appli.setSuggState", suggId);
	}
	public int setSuggFail(Map<String, Object> params) {
		return sqlSession.update("Appli.setSuggFail", params);
	}
	
	public int setAppState(String suggId){
		log.debug("setAppState >> suggId : " + suggId);
		return sqlSession.update("Appli.setAppState", suggId);
	}
	public int addPayRow(Map<String, Object> totalAndServId) {
		return sqlSession.insert("Appli.addPayRow", totalAndServId);
	}
	
	public List<Map<String, Object>> getMenuInfo(String suggId) {
		return sqlSession.selectList("Appli.getMenuInfo", suggId);
	}
	
	public List<Map<String, Object>> getReviewAvgScore(Map<String, Object> param){
		log.debug("param : " + param);
		return sqlSession.selectList("Appli.getReviewAvgScore", param);
	}
}
