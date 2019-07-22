package com.charida.app.telegram.component;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.common.service.TestService;

@Repository
public class CustomerShipDao {
	
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	SqlSession sqlSession;
	
	public List<Map<String, Object>> getShipServList(Map<String, Object> listParam){
		return sqlSession.selectList("ShipList.selectServList",listParam);
	}
	public int getServShipListCount(String mem_id) {
		return sqlSession.selectOne("ShipList.getServShipListCount", mem_id) ;
	}
	public int updateStatusComplete(String serv_id) {
		return sqlSession.update("ShipList.updateStatusComplete", serv_id) ;
	}
}
