package com.charida.app.payment.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.charida.app.common.dao.CommonDao;

@Repository
public class PaymentDao extends CommonDao{
	
	public Map<String,Object> selectPayInfo(String servId) {
		return sqlSession.selectOne("Pay.selectPayInfo", servId);
	}
}
