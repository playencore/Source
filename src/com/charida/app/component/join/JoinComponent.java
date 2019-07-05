package com.charida.app.component.join;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.member.dao.MemberDao;

@Component
public class JoinComponent {
	@Resource
	MemberDao memberDao;
	
	// 아이디 유효성 검사
	public int selectMemid(String memid) {
		int result = memberDao.selectMember(memid);
		return result;
	}
	
	
}
