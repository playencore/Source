package com.charida.app.supplier.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.supplier.SupplierComponent;
import com.charida.app.supplier.dto.*;

@Service
public class SupplierService {
	
	@Resource
	SupplierComponent suplierComponent ;
	
	public int setSupplierTx(SupplierDto supplierDto) {
		int result =  0 ;
		
		result = suplierComponent.setSupplier(supplierDto) ;
		
		return result ;
	}
	
	public String checkRegist_num(String regist_num) {
		int result = suplierComponent.checkRegist_num(regist_num) ;
		
		if(result == 0) {
			return "가입 가능한 업체입니다." ;
		}else {
			return "기존에 가입한 업체입니다. 확인해주세요." ;
		}
		
		
	}
}
