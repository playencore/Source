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
				if(loginComponent.authority(id).equals("4")) {
					// 판매자 승인전일때
					return 2;
				}else {
					// 판매자 가입승인됬을때
					return 1;
				}
			}else {
				return -1;	//비밀번호가 일치하지 않을때
			}
		}else {
			return 0;	//아이디가 없을때
		}
	}
	public String authority(String id) {
		return loginComponent.authority(id);
	}
	public String name(String id) {
		return loginComponent.name(id);
	}
	public int countKakaoId(String kakao_key){
		int result = loginComponent.countKakaoId(kakao_key);	// count(*) = 1 		
		if(result == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	public String getId(String kakao_key) {
		return loginComponent.getId(kakao_key);
	}
	
}













