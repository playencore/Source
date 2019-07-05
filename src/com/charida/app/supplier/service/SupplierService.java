package com.charida.app.supplier.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.supplier.SupplierComponent;
import com.charida.app.supplier.dto.*;

@Service
public class SupplierService {
	
	@Resource
	SupplierComponent suplierComponent ;
	
	public int setSupplier(SupplierDto supplierDto) {
		int result =  0 ;
		
		result = suplierComponent.setSupplier(supplierDto) ;
		
		return result ;
	}
}
