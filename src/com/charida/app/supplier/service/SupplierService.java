package com.charida.app.supplier.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.charida.app.component.supplier.SupplierComponent;
import com.charida.app.supplier.dto.PermissionDto;
import com.charida.app.supplier.dto.SupplierDto;

@Service
public class SupplierService {
	
	@Resource
	SupplierComponent supplierComponent ;
	
	public int setSupplierTx(Map <String,String[]> supplierMap) {
		int result = 0 ;
		
		
		//crd_company insert-----------------------------------------------------------------------------------
		SupplierDto supplierDto = new SupplierDto() ;
		supplierDto.setMem_id(supplierMap.get("mem_id")[0]);
		supplierDto.setName(supplierMap.get("companyname")[0]);
		supplierDto.setRegist_num(Integer.parseInt(supplierMap.get("regist_num")[0]));
		supplierDto.setExplanation(supplierMap.get("explanation")[0]);
		supplierDto.setMaximum_seating(Integer.parseInt(supplierMap.get("maximum_seating")[0]));
		supplierDto.setMinimum_seating(Integer.parseInt(supplierMap.get("minimum_seating")[0]));
		supplierDto.setCert_file_id(Integer.parseInt( supplierMap.get("cert_file_id")[0] ));
		supplierDto.setTelegram_id("telegram");
		
		result += supplierComponent.setSupplier(supplierDto) ;
		
		//crd_service_type---------------------------------------------------------------------------------------
		String checkseq = supplierComponent.getServiceCategoryMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		int seq = Integer.parseInt(checkseq) ;
		Map<String, Object> listMap = supplierComponent.getCodeListMap("service", supplierMap.get("mem_id")[0], 
				seq, supplierMap.get("serviceCategory")) ;
		result += supplierComponent.setServiceCategoryType(listMap) ;
		
		//crd_food_Style----------------------------------------------------------------------------
		checkseq = supplierComponent.getFoodStyleMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		Map<String, Object> flistMap = supplierComponent.getCodeListMap("food", supplierMap.get("mem_id")[0], 
				seq, supplierMap.get("foodCategory")) ;
		result += supplierComponent.setFoodStyle(flistMap) ;
		
		//CRD_SERVICE_AREA------------------------------------------------------------------------------------
		checkseq = supplierComponent.getServiceLocationMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		Map<String, Object> alistMap = supplierComponent.getCodeListMap("area", supplierMap.get("mem_id")[0], 
				seq, supplierMap.get("serviceLocation")) ;
		result += supplierComponent.setServiceLocation(alistMap) ;
		
		//info picture -------------------------------------------------------------------------------------
		Map<String,Object> plistMap = new HashMap<String, Object>() ;
		List<Integer> list = new ArrayList<Integer>() ;
		for(int i = 0 ; i <supplierMap.get("supplierInfoFile").length ; i++ ) {
			String supplierinfoFile = supplierMap.get("supplierInfoFile")[i] ;
			if(supplierinfoFile!=null) {
				list.add(Integer.parseInt(supplierinfoFile)) ;
			}
		}
		checkseq = supplierComponent.getIntroFileMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		plistMap.put("mem_id",supplierMap.get("mem_id")[0]) ;
		plistMap.put("intro_seq", seq) ;
		plistMap.put("list",list) ;
		result += supplierComponent.setIntroFile(plistMap);
		
		//CRD_MEM_PERMISSION
		checkseq = supplierComponent.getMemPermissionMaxSeq(supplierMap.get("mem_id")[0]) ;
		if(checkseq == null ) {
			checkseq = "0" ;
		}
		seq = Integer.parseInt(checkseq) ;
		PermissionDto dto = new PermissionDto() ;
		dto.setMem_id(supplierMap.get("mem_id")[0]);
		dto.setDisallowance_reason("-");
		dto.setPermission_seq(seq);
		dto.setPermission_yn(0);
		result+=supplierComponent.setPermission(dto) ;
		
		return result ;
	}
	
	public String checkRegist_num(String regist_num) {
		int result = supplierComponent.checkRegist_num(regist_num) ;
		
		if(result == 0) {
			return "가입 가능한 업체입니다." ;
		}else {
			return "기존에 가입한 업체입니다. 확인해주세요." ;
		}
	}
	////////////////////////////////adminpage
	public List<Map<String, String>> getNotPerMissionSuppliers(){
		return supplierComponent.getNotPermissionSuppliers() ;
	}
	////////////////////////////////////updatepermission 
	public String updatePermission(Map<String, String[]> permissionMap) {
		int result = supplierComponent.updatePermission(permissionMap);
		if(result == 0) {
			return "수정이 진행되지 않았습니다. 다시 확인해주세요." ;
		}else{
			return "수정이 완료되었습니다." ;
		}
	}
	
}









