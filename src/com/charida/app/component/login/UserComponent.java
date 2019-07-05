package com.charida.app.component.login;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.user.dao.UserDao;

@Component
public class UserComponent {
	
	@Resource
	UserDao userDao;
	
	public int countId(String id){
		int result = userDao.countId(id);	// count(*) = 1 		
		if(result != 0) {
			return 1;
		}else {
			return 0;
		}
	}
	
	public String checkPasswd(String id) {
		return userDao.checkPasswd(id);	// 해당아이디의 비밀번호요청값		
	}
}




