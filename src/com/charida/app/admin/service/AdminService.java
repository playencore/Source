package com.charida.app.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.charida.app.component.pagination.PaginationInfo;
import com.charida.app.component.supplier.SupplierComponent;

@Service
public class AdminService  {
	@Resource
	SupplierComponent supplierComponent;

////////////////////////////////adminpage
	public List<Map<String, String>> getNotPerMissionSuppliers(Map<String, Object> params ,HttpServletRequest req) {
		int pageNo = 1;
		if(params.get("pageNo")!= null) {
			pageNo = Integer.parseInt(((String)params.get("pageNo")));
		}
		req.setAttribute("pageNo", pageNo);
		PaginationInfo paging = new PaginationInfo();
		paging.setCurrentPageNo(pageNo);
		// 전체 사이즈 
		paging.setTotalRecordCount(supplierComponent.getNotPermissionSuppliersCount());
		req.setAttribute("paging", paging);
		Map<String, Object> listParam = new HashMap<String, Object>();
		listParam.put("startNum", paging.getFirstRecordIndex());
		listParam.put("endNum", paging.getLastRecordIndex());
		
		// 전체 알아보기 
		return supplierComponent.getNotPermissionSuppliers(listParam);
	}

////////////////////////////////////updatepermission 
	public String updatePermissionTx(Map<String, String[]> permissionMap) {
		int result = supplierComponent.updatePermission(permissionMap);
		int perresult = 3 ;
		if(permissionMap.get("permission_yn")[0].equals("1")) {
			perresult = supplierComponent.updatePermissionSup(permissionMap.get("mem_id")[0]); 
		}
		if (result == 0 || perresult == 0) {
			return "수정이 진행되지 않았습니다. 다시 확인해주세요.";
		} else {
			return "수정이 완료되었습니다.";
		}
	}
	public List<Object> getSerhchResult(Map<String, String> paramMap){
		
		if(paramMap.get("searchCategory").equals("NAME") || paramMap.get("searchCategory").equals("TEL")) {
			paramMap.put("table","M");
		}else {
			paramMap.put("table","C");
			if(paramMap.get("searchCategory").equals("COMPANYNAME")){
				paramMap.put("searchCategory","NAME") ;
			}
		}
		return supplierComponent.getSerchList(paramMap) ;
	}
}
