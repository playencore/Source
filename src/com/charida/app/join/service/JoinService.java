package com.charida.app.join.service;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;

import com.charida.app.common.service.TestService;

// 회원가입을 위한 서비스계층
public class JoinService {
	protected Log log = LogFactory.getLog(TestService.class);
	
	// String 으로 url를 받아서 해당 url로 페이지를 이동
	public void pageMove(String url) {
		
	}
	
	// 입력받은 값을 db에 
	public void join() {

	}

}
