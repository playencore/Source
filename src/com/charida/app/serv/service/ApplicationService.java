package com.charida.app.serv.service;

import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

@Service
public class ApplicationService {
	protected static Log log = LogFactory.getLog(ApplicationService.class);
	
	public void application(Map<String, String[]>params) {
		//1. 신청번호 발번
		//SERV20190709
		//2. 인서트
		//3. 끝
	}
}
