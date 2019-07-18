package com.charida.app.component.serv;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.charida.app.component.category.CategoryComponent;
import com.charida.app.serv.dao.ApplicationDao;

@Component
public class ApplicationComponent {
	@Resource
	private ApplicationDao applicationDao;
	@Resource
	private CategoryComponent categoryComponent;
	
	private static final String PERFIX = "S";
	private static final String INFIX ="-";
	protected static final Log log = LogFactory.getLog(ApplicationComponent.class);
	
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
			appId.append(String.format("%04d", suffix));
		}
		
		return appId.toString();
	}
	
	public Map<String,Object> getAppEntity(Map<String,Object>params){
		Map<String, Object> appEntities = new HashMap<String, Object>();
	
		appEntities.put("customer_id", params.get("sessionId"));
		appEntities.put("progress_code", "STU0010001");
		appEntities.put("zipcode", params.get("zipcode"));
		appEntities.put("address", params.get("addr"));
		appEntities.put("address_detail", params.get("addr2"));
		appEntities.put("participant", Integer.parseInt((String)params.get("participant")));
		appEntities.put("age_min", Integer.parseInt((String)params.get("age_min")));
		appEntities.put("age_max", Integer.parseInt((String)params.get("age_max")));
		appEntities.put("per_men",Integer.parseInt((String)params.get("percent")));
		appEntities.put("serv_type_code",params.get("serv_type"));
		appEntities.put("event_type_code",params.get("event_type"));
		
		String[] dessert = (String[])params.get("cb_dessert_type");
		if(dessert == null || dessert.length==0 || "".equals(dessert[0])) {
			appEntities.put("dessert_yn","N");
		}else {
			appEntities.put("dessert_yn","Y");
		}
		appEntities.put("per_bud",params.get("per_bud"));
		
		String serv_date = getDateFormat((String)params.get("serv_date")
										,(String)params.get("serv_time")
										);
		appEntities.put("serv_date",serv_date);
		appEntities.put("interior_yn",params.get("loc_type"));
		appEntities.put("cooking_yn",params.get("cooking_yn"));
		appEntities.put("discharge_yn",params.get("discharge_yn"));
		appEntities.put("elevator_yn",params.get("elev_yn"));
		appEntities.put("parking_yn",params.get("parking_yn"));
		
		String[] tableware = (String[])params.get("cb_tableware");
		if(tableware == null || tableware.length==0 || "".equals(tableware[0])) {
			appEntities.put("tableware_yn","N");
		}else {
			appEntities.put("tableware_yn","Y");
		}
		appEntities.put("coordinator_yn",params.get("codi_yn"));
		
		String[] addtion = (String[])params.get("cb_addtion");
		
		if(addtion == null || addtion.length==0 || "".equals(addtion[0])) {
			appEntities.put("other_order_yn","N");
		}else {
			appEntities.put("other_order_yn","Y");
		}
		
		appEntities.put("requested_term",params.get("req_term"));
		return appEntities;
	}
	public int insertDatas(Map<String, Object> entity) {
		return applicationDao.insertRow(entity);
	}
	
	
	public String getDateFormat(String date,String time) {
		
		String timePerfix =time.substring(0,time.indexOf(" "));
        
		int hour = Integer.parseInt(time.substring(time.indexOf(" ")+1,time.indexOf(":")));
        int minute = Integer.parseInt(time.substring(time.indexOf(":")+1,time.length()));
        
        if("오후".equals(timePerfix)){
            hour = hour+12;
        }
        
        return date+ " " +hour +":"+minute +":00";
	}
	public List<String> getAddOrderList(String servId){
		return  applicationDao.selectAddOrderList(servId);
		
	}
	
	public List<String> getPrefList(String servId,boolean transForm){
		List<String> prefList = applicationDao.selectPrefList(servId);

		if(prefList == null ) {
			return null;
		}
		
		if(!transForm) {
			return prefList;
		}
		
		List<String> prefNameList = new ArrayList<String>();
		
		for(String prepCode : prefList) {
			prefNameList.add(categoryComponent.getCodeName(prepCode)); 
		}
		
		return prefNameList;
	}
	
	public int updateProgress(String servId,String progressCode) {
		Map<String, String> datas = new HashMap<String, String>();
		datas.put("servId", servId);
		datas.put("progressCode", progressCode);
		
		return applicationDao.updateProgress(datas);
	}
}
