package com.charida.app.component.payment;

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
}
