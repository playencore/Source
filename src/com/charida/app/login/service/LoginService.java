package com.charida.app.login.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.login.LoginComponent;

@Service
public class LoginService {
	@Resource
	LoginComponent loginComponent;

	public int checkPasswd(String id, String passwd) {
		if(loginComponent.countId(id) == 1) {
			//아이디가 있다.
			if(loginComponent.checkPasswd(id).equals(passwd)) {
				return 1;	//비밀번호가 일치할때
			}else {
				return -1;	//비밀번호가 일치하지 않을때
			}
		}else {
			return 0;	//아이디가 없을때
		}		
	}
	
}













