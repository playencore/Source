package com.charida.app.file.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.charida.app.component.file.FileComponent;

@Controller
public class FileController {
	
	@Resource
	private FileComponent fileComponent;
	
	@RequestMapping("/file-down/{id}")
	public void fileDownload(
				@PathVariable("id") String fileId,HttpServletResponse resp) {
			
		Map<String, Object> fileInfo = fileComponent.getFileInfo(fileId);
		if(fileInfo !=null && fileInfo.get("FILE_PATH") != null) {
			String path = (String)fileInfo.get("FILE_PATH");
		 	String name = (String)fileInfo.get("FILE_SAVE_NAME");
		 	String originName = (String)fileInfo.get("FILE_NAME");
		 	String fileName = path + "/" + name;
		 	
		 	BufferedInputStream bis = null;
		 	BufferedOutputStream bos = null;
		 	try {
			 	resp.setContentType("text/unknown");
			 	resp.setHeader("content-disposition", 
			 			"attachment;filename="+URLEncoder.encode(originName,"utf-8")+";");
		
			 	bis = new BufferedInputStream(new FileInputStream(fileName));
			 	bos = new BufferedOutputStream(resp.getOutputStream());
			 	
			 	byte [] buffer = new byte[1024]; 
			 	int length = 0;
			 	while( (length = bis.read(buffer, 0, buffer.length)) !=-1){
			 		bos.write(buffer, 0, length);	
			 	}
		 	
		 	} catch (IOException e ) {
				
			}finally {
				try {
					bos.flush();
					bis.close();
				 	bos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
}
