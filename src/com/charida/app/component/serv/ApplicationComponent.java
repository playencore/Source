package com.charida.app.component.serv;

import java.sql.Timestamp;
import java.util.GregorianCalendar;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.serv.dao.ApplicationDao;

@Component
public class ApplicationComponent {
	@Resource
	private ApplicationDao applicationDao;
	private static final String PERFIX = "S";
	private static final String INFIX ="-";
	//신청번호 발번
	public String makeAppId() {
		//char12 S190710-0001
		StringBuffer appId = new StringBuffer();
		appId.append(PERFIX);
		
		GregorianCalendar calendar = new GregorianCalendar();
		
		String year = Integer.toString(calendar.get(GregorianCalendar.YEAR));
		year = year.substring(2, year.length());
		appId.append(year);
		
		
		String month = Integer.toString((calendar.get(GregorianCalendar.MONTH)+1));
		if(month.length() == 1) {
			month = "0" + month;
		}
		appId.append(month);
		
		String day = Integer.toString(calendar.get(GregorianCalendar.DAY_OF_MONTH));
		if(day.length() == 1) {
			day = "0" + day;
		}
		appId.append(day);
		appId.append(INFIX);
		
		String checkId = applicationDao.SelectServId(appId.toString());
		
		if(checkId == null || "".equals(checkId)) {
			appId.append("0001");
		}else {
			String idNum = checkId.substring(checkId.indexOf("-")+1,checkId.length());
			int suffix = Integer.parseInt(idNum);
			suffix +=1;
			appId.append(suffix);
		}
		
		return appId.toString();
	}
	
	/*
	 * public Date getTimestamp(String date,String time) {
	 * 
	 * return new Date() }
	 */
	
}
