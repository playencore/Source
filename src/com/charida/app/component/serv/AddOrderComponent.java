package com.charida.app.component.serv;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.serv.dao.AddOrderDao;

@Component
public class AddOrderComponent {
	@Resource
	private AddOrderDao addOrderDao;
	
	public int insertOrder(String servId,String orderCode,int seq) {
		
		return addOrderDao.insertRow(getEntity(servId,orderCode,seq));
	}
	
	public Map<String,Object>getEntity(String servId,String orderCode,int seq){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("serv_id",servId);
		params.put("add_seq",seq);
		params.put("parent_code",getParentCode(orderCode));
		params.put("add_code", orderCode);
		
		return params;
	}
	
	public String getParentCode(String childrenCode) {
		return childrenCode.substring(0, 3) + "0000000";
	}
}
