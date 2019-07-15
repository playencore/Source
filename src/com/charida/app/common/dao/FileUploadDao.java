package com.charida.app.common.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class FileUploadDao {
	@Resource
	SqlSession sqlSession;
	
	public int insertFile(Map<String, Object> fileInfo) {
		return sqlSession.insert("File.insertFile",fileInfo);
	}
	public int selectFileSeq() {
		return sqlSession.selectOne("File.selectFileSeq");
	}
	
	public Map<String, Object>getFileInfo(String fileId){
		return sqlSession.selectOne("File.selectFile",fileId);
	}
}
