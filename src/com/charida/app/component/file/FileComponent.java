package com.charida.app.component.file;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.charida.app.common.dao.FileUploadDao;

@Component
public class FileComponent {
	@Resource
	private FileUploadDao fileUploadDao;
	
	public int insertFile(Map<String, Object> fileInfo) {
		int seq = 0;
		seq = fileUploadDao.selectFileSeq();
		fileInfo.put("file_id", seq);
		System.out.println(seq);
		System.out.println(fileInfo.get("file_name"));
		System.out.println(fileInfo.get("file_save_name"));
		System.out.println(fileInfo.get("file_path"));
		System.out.println(fileInfo.get("file_size"));
		
		fileUploadDao.insertFile(fileInfo);
		return seq;
	}
}
