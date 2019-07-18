package com.charida.app.component.shipping;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.shipping.dao.ShippingDao;

@Component
public class ShippingComponent {
	@Resource
	private ShippingDao shippingDao;
	
	public String insertEntity(String servId) {
		String msg = null;
		int result = 0;
		
		result = shippingDao.insertEntity(servId);
		
		if(result == 1 ) {
			msg = "요청이 성공적으로 처리되었습니다.";
		}
		
		return msg;
	}
	
	public Map<String, Object> getShippingInfo(String servId){
		return shippingDao.selectShippingInfo(servId);
	}
	
	public int updateEndDate(String servId) {
		return shippingDao.updateEndDate(servId);
	}
}
