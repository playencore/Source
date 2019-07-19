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
}
