package com.charida.app.login.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDao {
	@Resource
	SqlSession sqlSession;
	
	public int countId(String id) {
		return sqlSession.selectOne("Login.countId",id);
	}
	public int countKakaoId(String kakao_key) {
		return sqlSession.selectOne("Login.countKakaoId",kakao_key);
	}
	
	public String checkPasswd(String id) {
		return sqlSession.selectOne("Login.checkPasswd",id);
	}
	
	public String authority(String id) {
		return sqlSession.selectOne("Login.authority",id);
	}
	public String name(String id) {
		return sqlSession.selectOne("Login.name",id);
	}
	public String getId(String kakao_key) {
		return sqlSession.selectOne("Login.getId",kakao_key);
	}
}





