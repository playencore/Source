package com.charida.app.sales.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.payment.PaymentComponent;

@Service
public class SalesService {
	@Resource
	private PaymentComponent paymentComponent;
	
	public List<Map<String, Object>> 
		getSaleList(String memId,String startDate,String endDate,String colCondition){
		
		return paymentComponent.getSalesList(memId, startDate, endDate, colCondition);
	}
	
	public List<Map<String, Object>> getsaleInfo(String memId,String startDate,String endDate){
		return paymentComponent.getSaleInfo(memId, startDate, endDate);
	}
}
