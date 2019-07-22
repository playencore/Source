package com.charida.app.telegram.component;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

@Component
public class CustomerShipComponent {
	
	@Resource
	CustomerShipDao customerShipDao ;
	
	public List<Map<String, Object>> getShipServList(Map<String, Object> listParam){
		return customerShipDao.getShipServList(listParam);
	}
	
	public int getServShipListCount(String mem_id) {
		return customerShipDao.getServShipListCount(mem_id) ;
	}
	public int updateStatusComplete(String serv_id) {
		return customerShipDao.updateStatusComplete(serv_id);
	}
}
