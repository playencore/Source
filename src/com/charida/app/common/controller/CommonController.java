package com.charida.app.common.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class CommonController {
	
	public Map<String, Object> getParameterMap(HttpServletRequest req,boolean requireId){
		Map<String, Object> params = new HashMap<String, Object>();
		Enumeration<String> keys= req.getParameterNames();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			if(key.indexOf("cb")!=-1 || key.indexOf("sb")!=-1) { //배열값
				params.put(key,req.getParameterValues(key));
			}else {
				params.put(key,req.getParameter(key));
			}
		}
		
		if(requireId) {
			params.put("sessionId", (String)req.getSession().getAttribute("session_id"));
		}
		
		return params;
	}
}
