package com.charida.app.supplier.dao;

import javax.annotation.Resource;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.charida.app.common.service.TestService;
import com.charida.app.supplier.dto.SupplierDto;

@Repository
public class SupplierDao {
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	SqlSession sqlSession;
	
	public int insertSupplier(SupplierDto supplierDto) {	
		return sqlSession.insert("Test.insertSupplier",supplierDto);
	}
	
	public int checkSupplierName(String supplierName) {
		return sqlSession.selectOne("Test.checkSupplierName", supplierName) ;
	}
}
