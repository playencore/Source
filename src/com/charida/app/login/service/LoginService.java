package com.charida.app.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.login.UserComponent;

@Service
public class LoginService {
	@Resource
	UserComponent userComponent;
	
//	public boolean countId(String id) {
//		
//		int result = userComponent.checkId(id);
//		if(result == 1) {	//아이디가 있다.
//			checkPasswd(id)
//			return true;
//		}else {
//			return false;
//		}
//	}
	public int checkPasswd(String id, String passwd) {
		if(userComponent.countId(id) == 1) {
			//아이디가 있다.
			if(userComponent.checkPasswd(id).equals(passwd)) {
				return 1;	//비밀번호가 일치할때
			}else {
				return 0;	//비밀번호가 일치하지 않을때
			}
		}else {
			return 0;	//아이디가 없을때
		}		
	}
	
}









