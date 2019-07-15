package com.charida.app.component.join;

import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.charida.app.common.service.TestService;
import com.charida.app.member.dao.MemberDao;
import com.charida.app.member.dto.MemberDto;

@Component
public class JoinComponent {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	MemberDao memberDao;
	
	// 아이디 유효성 검사
	public int selectMemid(String memid) {
		int result = memberDao.selectMember(memid);
		return result;
	}
	
	public boolean isPasswdCombination(String text) {
		boolean check = false;
		if( Pattern.matches("^[a-zA-Z]*$", text) && Pattern.matches("^[0-9]*$", text) ) {
			check = true;
		} else {
			check = false;
		}
		return check;
	}
	
	public boolean isEquals(String a, String b) {
		boolean check = false;
		if( a.equals(b) ) {
			check = true;
		} else {
			check = false;
		}
		return check;
	}
	
	// 회원가입
	public int setMember( MemberDto memberDto ) {
		log.debug("JoinComponent > setMember( memberDto ) 호출시작");
		int result = memberDao.insertMember( memberDto );
		log.debug("JoinComponent > setMember( memberDto ) 호출결과" + result);
		
		return result;
	}
}
