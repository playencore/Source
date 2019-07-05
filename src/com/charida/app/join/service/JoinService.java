package com.charida.app.join.service;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.charida.app.common.service.TestService;
import com.charida.app.component.join.JoinComponent;

// 회원가입을 위한 서비스계층
@Service
public class JoinService {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	JoinComponent joinComponent;
	
	// 아이디 중복 확인
	public String isOnly(String id){ 
		log.debug("joinService : checkid(String id) >>>>>>>> " + id);
		int check = joinComponent.selectMemid(id);
		log.debug("checkid( 0:가입가능 , 1:가입불가 ) " + check);
		String result = "1";
		if( check == 1 ) {
			// 가입 불가 : 아이디 사용불가
			result = "1";
		} else if( check == 0 ) {
			// 가입 가능 : 아이디 사용가능
			result = "0";
		}
		return result;
	}


}
