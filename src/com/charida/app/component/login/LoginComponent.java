package com.charida.app.component.login;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.login.dao.LoginDao;

@Component
public class LoginComponent {
	
	@Resource
	LoginDao loginDao;
	
	public int countId(String id){
		int result = loginDao.countId(id);	// count(*) = 1 		
		if(result != 0) {
			return 1;
		}else {
			return 0;
		}
	}
	public int countKakaoId(String kakao_key){
		int result = loginDao.countKakaoId(kakao_key);	// count(*) = 1 		
		if(result == 1) {
			return 1;
		}else {
			return 0;
		}
	}

	public String checkPasswd(String id) {
		return loginDao.checkPasswd(id);	// 해당아이디의 비밀번호요청값		
	}
	public String authority(String id) {
		return loginDao.authority(id);
	}
	public String name(String id) {
		return loginDao.name(id);
	}
}




