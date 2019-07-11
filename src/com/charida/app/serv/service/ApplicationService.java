package com.charida.app.serv.service;

import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.charida.app.component.serv.AddOrderComponent;
import com.charida.app.component.serv.ApplicationComponent;
import com.charida.app.component.serv.PreferComponent;

@Service
public class ApplicationService {
	@Resource
	private ApplicationComponent applicationComponent;
	@Resource
	private AddOrderComponent addOrderComponent;
	@Resource
	private PreferComponent preferComponent;
	
	private static final Log log = LogFactory.getLog(ApplicationService.class);
	
	public String applicationTx(Map<String,Object>params) {
		//신청번호 발번
		String appId = applicationComponent.makeAppId();
		log.debug("신청번호 : " + appId);
		
		printParams(params);
		
		//데이터 포맷
		Map<String, Object> appEntity = applicationComponent.getAppEntity(params);
		appEntity.put("serv_id", appId);
		
		//CRD_SERV_APP INSERT
		applicationComponent.insertDatas(appEntity);
		int seq = 1;
		
		
		String[] menus = (String[])params.get("cb_menu_type"); 
		for(String menu:menus) { 
			log.debug(menu);
			preferComponent.insertPreferMenu(appId, menu, seq++);
		}
		
		seq = 1;
		
		//디저트 추가주문
		if("Y".equals(appEntity.get("dessert_yn"))) {
			String[] desserts = (String[])params.get("cb_dessert_type");
			for(String dessert:desserts) {
				addOrderComponent.insertOrder(appId,dessert, seq++);
			}
		}
		//식기류 추가주문
		if("Y".equals(appEntity.get("tableware_yn"))) {
			String[] tablewares = (String[])params.get("cb_tableware");
			for(String tableware:tablewares) {
				addOrderComponent.insertOrder(appId,tableware, seq++);
			}
		}
		//기타 대여품
		if("Y".equals(appEntity.get("other_order_yn"))) {
			String[] addtions = (String[])params.get("cb_addtion");
			for(String addtion:addtions) {
				addOrderComponent.insertOrder(appId,addtion, seq++);
			}
		}
		
		//3. 끝
		return appId;
	}
	
	public void printParams(Map<String,Object>params) {
		Iterator<String> keys =	params.keySet().iterator();
		
		while(keys.hasNext()) {
			String key = keys.next();
			Object value = params.get(key);
			
			if(value instanceof String[]) {
				for(String item:(String[])value) {
					log.debug(key +" : " +item);
				}
			}else {
				log.debug(key +" : " +(String)value);
			}
		}
	}
}
