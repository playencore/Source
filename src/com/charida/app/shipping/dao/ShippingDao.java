package com.charida.app.shipping.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;

@Repository
public class ShippingDao extends CommonDao{
	
	public int insertEntity(String servId) {
		return sqlSession.insert("Shipping.insertEntity", servId);
	}
	public Map<String, Object> selectShippingInfo(String servId){
		return sqlSession.selectOne("Shipping.selectShippingInfo", servId);
	}
	public int updateEndDate(String servId) {
		return sqlSession.update("Shipping.updateEndDate", servId);
	}
}
