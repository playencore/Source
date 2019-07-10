package com.charida.app.component.supplier;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.supplier.dao.SupplierDao;
import com.charida.app.supplier.dto.CodeDto;
import com.charida.app.supplier.dto.FoodStyleDto;
import com.charida.app.supplier.dto.PermissionDto;
import com.charida.app.supplier.dto.ServiceAreaDto;
import com.charida.app.supplier.dto.ServiceTypeDto;
import com.charida.app.supplier.dto.SupplierDto;

@Component
public class SupplierComponent {
	
	@Resource
	SupplierDao supplierDao ;

	//crd_company
	public int setSupplier(SupplierDto supplierDto) {
		
		int result =supplierDao.insertSupplier(supplierDto);
		
		return result ;
	}
	//crd_service_Type 
	public String getServiceCategoryMaxSeq(String mem_id) {
		return supplierDao.selectServiceCategoryMaxSeq(mem_id) ;
	}
	public int setServiceCategoryType(Map<String, Object> listMap) {
		return supplierDao.insertServiceCategoryType(listMap) ;
	}
	//crd_food_Style
	public String getFoodStyleMaxSeq(String mem_id) {
		return supplierDao.selectFoodStyleMaxSeq(mem_id) ;
	}
	public int setFoodStyle(Map<String, Object> listMap) {
		return supplierDao.insertFoodStyle(listMap) ;
	}
	//crd_service_location
	public String getServiceLocationMaxSeq(String mem_id) {
		return supplierDao.selectServiceLocationMaxSeq(mem_id) ;
	}
	public int setServiceLocation(Map<String, Object> listMap) {
		return supplierDao.insertServiceLocation(listMap) ;
	}
	//CRD_INTRO_FILE
	public String getIntroFileMaxSeq(String mem_id) {
		return supplierDao.selectIntroFileMaxSeq(mem_id) ;
	}
	public int setIntroFile(Map<String, Object> listMap) {
		return supplierDao.insertIntroFile(listMap) ;
	}
	//CRD_MEM_PERMISSION
	public String getMemPermission(String mem_id) {
		return supplierDao.selectMemPermissionMaxSeq(mem_id) ;
	}
	public int setPermission(PermissionDto dto) {
		return supplierDao.insertPermission(dto) ;
	}
	
	public int checkRegist_num(String regist_num) {
		int result =  0 ;
		
		result =supplierDao.checkRegist_num(regist_num);		
				
		return result ;
	}
	
	public Map<String,Object> getCodeListMap(String code_name ,String mem_id , int seqStartNum, String[] code){
		Map<String, Object> listMap = new HashMap<String, Object>() ;
		List<CodeDto> list = new ArrayList<CodeDto>() ;
		if(code_name.equals("service")) {
			for(int i = 0 ; i < code.length; i ++) {
				CodeDto codeDto = new ServiceTypeDto() ;
				codeDto.setMem_id(mem_id);
				codeDto.setSeq(seqStartNum++);
				codeDto.setCode(code[i]);
				list.add(codeDto) ;
			}
		}else if(code_name.equals("area")) {
			for(int i = 0 ; i < code.length; i ++) {
				CodeDto codeDto = new ServiceAreaDto() ;
				codeDto.setMem_id(mem_id);
				codeDto.setSeq(seqStartNum++);
				codeDto.setCode(code[i]);
				list.add(codeDto) ;
			}
		}else if(code_name.equals("food")) {
			for(int i = 0 ; i < code.length; i ++) {
				CodeDto codeDto = new FoodStyleDto() ;
				codeDto.setMem_id(mem_id);
				codeDto.setSeq(seqStartNum++);
				codeDto.setCode(code[i]);
				list.add(codeDto) ;
			}
		}
		listMap.put("list", list) ;
		return listMap ;
	}
////////////////////////////////////////////////supplier 승인
	
	public List<SupplierDto> getSuppliers(){
		return  supplierDao.selectSuppliers() ;
	}
	public List<Map<String, String>> getNotPermissionSuppliers(){
		return supplierDao.selectNotPermissionSuppliers() ;
	}
}















