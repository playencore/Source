package com.charida.app.payment.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;

@Repository
public class PaymentDao extends CommonDao{
	
	public Map<String,Object> selectPayInfo(String servId) {
		return sqlSession.selectOne("Pay.selectPayInfo", servId);
	}
	
	public List<Map<String, Object>> selectSalesList(Map<String, String> params){
		return sqlSession.selectList("Pay.selectSalesList",params);
	}
	public List<Map<String, Object>> getSaleInfo(Map<String, String> params){
		return sqlSession.selectList("Pay.getSaleInfo",params);
	}
}
