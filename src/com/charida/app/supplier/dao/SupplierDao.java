package com.charida.app.supplier.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.common.service.TestService;
import com.charida.app.supplier.dto.PermissionDto;
import com.charida.app.supplier.dto.SupplierDto;

@Repository
public class SupplierDao {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	SqlSession sqlSession;
	
	public int insertSupplier(SupplierDto supplierDto) {	
		return sqlSession.insert("Supplier.insertSupplier",supplierDto);
	}
	
	public int checkRegist_num(String regist_num) {
		int regist_numb = Integer.parseInt(regist_num.trim());
		log.debug("-----"+regist_numb+"------");
		return sqlSession.selectOne("Supplier.checkSupplierNum", regist_numb) ;
	}
	//crd_serviceType
	public String selectServiceCategoryMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectServiceCategoryMaxSeq",mem_id);
	}	
	public int insertServiceCategoryType(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertServiceCategoryType", listMap) ;
	}
	//crd_FoodStyle
	public String selectFoodStyleMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectFoodStyleMaxSeq",mem_id);
	}	
	public int insertFoodStyle(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertFoodStyle", listMap) ;
	}
	//crd_service_location
	public String selectServiceLocationMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectServiceLocationMaxSeq",mem_id);
	}	
	public int insertServiceLocation(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertServiceLocation", listMap) ;
	}
	//CRD_INTRO_FILE
	public String selectIntroFileMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectIntroFileMaxSeq",mem_id);
	}
	public int insertIntroFile(Map<String, Object> listMap) {
		return sqlSession.insert("Supplier.insertIntroFile", listMap) ;
	}
	//CRD_MEM_PERMISSION
	public String selectMemPermissionMaxSeq(String mem_id) {
		return sqlSession.selectOne("Supplier.selectMemPermissionMaxSeq",mem_id);
	}
	public int insertPermission(PermissionDto dto) {
		return sqlSession.insert("Supplier.insertPermission",dto) ;
	}
}
