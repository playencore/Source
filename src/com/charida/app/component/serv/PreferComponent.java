package com.charida.app.component.serv;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.serv.dao.PreferDao;

@Component
public class PreferComponent {
	@Resource
	private PreferDao preferDao;
	
	public int insertPreferMenu(String servId,String preferCode,int seq) {
		return preferDao.insertRow(getEntity(servId, preferCode, seq));
	}
	
	public Map<String,Object>getEntity(String servId,String preferCode,int seq){
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("serv_id",servId);
		params.put("prep_seq",seq);
		params.put("prep_code", preferCode);
		System.out.println(params);
		return params;
	}
}
