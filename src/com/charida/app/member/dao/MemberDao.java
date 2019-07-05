package com.charida.app.member.dao;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Resource
	SqlSession sqlSession;
	
	public int selectMember(String id) {
		return sqlSession.selectOne("Member.selectMemid", id);
	}
}
