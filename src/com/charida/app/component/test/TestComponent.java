package com.charida.app.component.test;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.common.dao.TestDao;

@Component
public class TestComponent {
	@Resource
	TestDao testdao;
	public boolean isOver() {
		Boolean result = false;
		
		int memCount = testdao.selectMember();
		
		if(memCount>15) {
			result =true;
		}
		
		return result;
	}
}
