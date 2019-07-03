package com.charida.app.common.service;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.charida.app.common.dao.TestDao;
import com.charida.app.component.test.TestComponent;
@Service
public class TestService {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	TestComponent testComponent;

	public void getTestTx() {
		log.debug("aaaaaaaa");
		/* tt(); */
	}
	public void tt() {
		testComponent.isOver();
	}
}
