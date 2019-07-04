package com.charida.app.component.supplier;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.supplier.dao.SupplierDao;
import com.charida.app.supplier.dto.SupplierDto;

@Component
public class SupplierComponent {
	
	@Resource
	SupplierDao supplierDao ;

	public int setSupplier(SupplierDto supplierDto) {
		int result =  0;
		
		result =supplierDao.insertSupplier(supplierDto);
		
		return result ;
	}
	
}
