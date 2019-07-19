package com.charida.app.component.appli;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.charida.app.appli.dao.AppliDao;
import com.charida.app.common.service.TestService;

@Component
public class AppliComponent {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	private AppliDao appliDao;
	
	public List<Map<String, Object>> getAppliList(Map<String, Object> param) {
		return appliDao.getAppliList(param);
	}
	public int getAppliListCount(String appli_id) {
		return appliDao.getAppliListCount(appli_id);
	}
	
	
	public String formatByComma(String str) {
		return str.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	}
}
