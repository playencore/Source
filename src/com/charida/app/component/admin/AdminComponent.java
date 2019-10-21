package com.charida.app.component.admin;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.charida.app.admin.dao.AdminDao;
import com.charida.app.common.service.TestService;

@Component
public class AdminComponent {
	
	protected Log log = LogFactory.getLog(TestService.class);
	
	@Resource
	AdminDao adminDao ;
	
	public List< Map<String, Object> > getAllServList(){
		return adminDao.selectAllServList()  ;
	}
	public List< Map<String, Object> > getAllServToSugg(String serv_id){
		return adminDao.selectServToSugg(serv_id)  ;
	}
	public List< Map<String, Object> > getChooseSuggMenu(String sugg_id){
		return adminDao.selectChooseSuggMenu(sugg_id)  ;
	}
	
	
}
