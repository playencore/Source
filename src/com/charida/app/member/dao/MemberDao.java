package com.charida.app.member.dao;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.common.service.TestService;
import com.charida.app.member.dto.MemberDto;

@Repository
public class MemberDao {
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	SqlSession sqlSession;
	
	public int selectMember(String id) {
		log.debug("MemberDao > selectMember : SQL진행");
		return sqlSession.selectOne("Member.selectMemid", id);
	}
	
	public int insertMember( MemberDto member ) {
		log.debug("MemberDao > insertMember : SQL진행 : " + member );
		return sqlSession.insert("Member.insertMember", member );
	}
}
