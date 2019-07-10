package com.charida.app.serv.service;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.charida.app.component.serv.ApplicationComponent;

@Service
public class ApplicationService {
	@Resource
	private ApplicationComponent applicationComponent;
	protected static Log log = LogFactory.getLog(ApplicationService.class);
	
	public void application(Map<String,Object>params) {
		
		//신청번호 발번
		String appId = applicationComponent.makeAppId();
		log.debug("신청번호 : " + appId);
		
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
		//2. 인서트
		Map<String, Object> appEntities = new HashMap<String, Object>();
		appEntities.put("serv_id", appId);
		//TODO 세션 생기면 수정
		appEntities.put("customer_id", "test123");
		//appEntities.put("customer_id", params.get("sessionId"));
		appEntities.put("progress_code", "stu0000010");
		appEntities.put("zipcode", params.get("zipcode"));
		appEntities.put("address", params.get("addr"));
		appEntities.put("address_detail", params.get("addr2"));
		appEntities.put("participant", Integer.parseInt((String)params.get("participant")));
		appEntities.put("age_min", Integer.parseInt((String)params.get("age_min")));
		appEntities.put("age_max", Integer.parseInt((String)params.get("age_max")));
		appEntities.put("per_men",Integer.parseInt((String)params.get("percent")));
		appEntities.put("serv_type_code",params.get("serv_type"));
		appEntities.put("event_type_code",params.get("event_type"));
		
		String[] dessert = (String[])params.get("dessert_type");
		if(dessert == null || dessert.length==0 || "".equals(dessert[0])) {
			appEntities.put("DESSERT_YN","N");
		}else {
			appEntities.put("DESSERT_YN","Y");
		}
		
		appEntities.put("per_bud",params.get("per_bud"));
		appEntities.put("SERV_DATE",params.get("per_bud"));
		
		
		//3. 끝
	}
}
