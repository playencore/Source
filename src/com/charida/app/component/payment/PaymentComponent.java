package com.charida.app.component.payment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.payment.dao.PaymentDao;

@Component
public class PaymentComponent {
	@Resource
	private PaymentDao paymentDao;
	
	public Map<String, Object> getWaitPayInfo(String servId){
		return paymentDao.selectPayInfo(servId);
		
	}
	
	public String formatByComma(String str) {
		return str.replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	}
	
	public List<Map<String, Object>> getSalesList(String memId, String startDate
			, String endDate,String colCondition){
		Map<String,String> params = new HashMap<String, String>();
		params.put("memId", memId);
		if("2".equals(colCondition)) {
			String startMonth = startDate.substring(0,startDate.lastIndexOf("-"));
			String endMonth = endDate.substring(0,endDate.lastIndexOf("-"));
			params.put("startMonth", startMonth);
			params.put("endMonth", endMonth);
		}
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		params.put("colCondition", colCondition);
		
		return paymentDao.selectSalesList(params);
	}
	
	public List<Map<String,Object>> getSaleInfo(String memId, String startDate
			, String endDate){
		Map<String,String> params = new HashMap<String, String>();
		params.put("memId", memId);
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		
		return paymentDao.getSaleInfo(params);
	}
}
