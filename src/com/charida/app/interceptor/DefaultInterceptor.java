package com.charida.app.interceptor;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.charida.app.component.file.FileComponent;

public class DefaultInterceptor extends HandlerInterceptorAdapter {
	@Resource
	private FileComponent fileComponent;
	private static final Log log = LogFactory.getLog(DefaultInterceptor.class);
	
	private static final String[] ARR_PASS_URI 
		= new String[]{
			"/main.do"
			,"/login/loginForm.do"
			,"/login/loginCheck.do"
			,"/review/review.do"
			,"/intro/introduce.do"
			,"/login/kakaoLogin.do"
		};
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		log.debug("---------------인터셉터---------------\n");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		if(isCheckUri(request.getRequestURI())) {
			if(isNotExist(request.getSession())) {
				response.sendRedirect("/login/loginForm.do");
				return false;
			}
		}
		
		printUrl(request);
		
		if(isMultiForm(request.getContentType())) {
			uploadFiles(request);
		}
		log.debug("---------------인터셉터---------------");
		return super.preHandle(request, response, handler);
	}

	public void printUrl(HttpServletRequest request) {
		log.debug("요청 url : " + request.getRequestURL() );
		Map<String, String> params = new HashMap<String, String>();
		Enumeration<String> keys= request.getParameterNames();
		
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			params.put(key,request.getParameter(key));
		}
		log.debug("params : " +params );
	}
	public boolean isMultiForm(String contentType) {
		log.debug("contentType : " +contentType);
		if(contentType == null) return false;
		if(contentType.indexOf("multipart/form-data")== -1) return false;
		
		return true;
	}
	public boolean uploadFiles(HttpServletRequest request) {
		boolean flag = false;
		log.debug("multipart");

		String path = createDir();
		
		MultipartRequest mReq = (MultipartRequest)request;
		Iterator<String> inputNames = mReq.getFileNames();
		int num = 1;
		while(inputNames.hasNext()) {
			MultipartFile file = mReq.getFile(inputNames.next());
			System.out.println(file.getName());
			
			String OrigName = file.getOriginalFilename();
			System.out.println(OrigName);
			if(OrigName ==null || "".equals(OrigName)) {
				continue;
			}
			File dest = makeFile(path,OrigName);
			System.out.println("sdss : "+dest.getName());
			try {
				file.transferTo(dest);
				
				Map<String, Object> fileInfo = new HashMap<String, Object>();
				fileInfo.put("file_name", file.getOriginalFilename());
				fileInfo.put("file_save_name", dest.getName());
				fileInfo.put("file_path", path);
				fileInfo.put("file_size", file.getSize());
				
				int seq = 0;
				seq = fileComponent.insertFile(fileInfo);
				
				request.setAttribute("file_id" + num++, seq);
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return flag;
	}
	public String createDir() {
		StringBuffer path= new StringBuffer();
		GregorianCalendar calendar = new GregorianCalendar();
		
		path.append("C:\\ExpertJava");
		path.append("\\"+(calendar.get(GregorianCalendar.YEAR)));
		path.append("\\"+(calendar.get(GregorianCalendar.MONTH)+1));
		path.append("\\"+calendar.get(GregorianCalendar.DAY_OF_MONTH));
		
		File file = new File(path.toString());
		System.out.println(file.isDirectory());
		if(!file.isDirectory()) {
			file.mkdirs();
		}
		
		return path.toString();
	}
	public File makeFile(String path,String fileName) {
		String saveFileName = fileName.substring(0,fileName.lastIndexOf("."));
		String ext = fileName.substring(fileName.lastIndexOf("."));
		
		String saveFilePath = path + File.separator+ fileName;
		File saveFile = new File(saveFilePath);
		
		int i = 1;

		while(saveFile.exists()) {
			saveFilePath = path + File.separator + saveFileName+"_"+ i++ +ext;
			saveFile = new File(saveFilePath);
		}
		System.out.println(saveFilePath);
		
		return saveFile;
	}
	public boolean isNotExist(HttpSession session) {
		Object sessionId = session.getAttribute("session_id");
		
		if(sessionId == null) {
			return true;
		}
		
		return false;
	}
	public boolean isCheckUri(String uri) {

		for(String passUri :ARR_PASS_URI ) {
			if(passUri.indexOf(uri) != -1) {
				return false;
			}
		}
		
		return true;
	}
}
