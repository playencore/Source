package com.charida.app.common.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.charida.app.common.service.TestService;

@Controller
public class TestController {
	private final static String returnUrl = "/common/test";
	@Resource
	private TestService testService;
	
	@RequestMapping("/test/test.do")
	public String home(Locale locale, Model model,HttpServletRequest req) {
		System.out.println(req.getParameter("aa"));
		testService.tt();
		
		//model.addAttribute("serverTime", formattedDate );
		
		return returnUrl;
	}
	@RequestMapping("/common/ajaxtest.do")
	public String ajax(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/common/ajaxtest";
	}
	
	/*AJAX JSON 예*/
	@RequestMapping("/test/testApi.do")
	@ResponseBody
	public Map<String,Object> ajaxJson(Model model,HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
		Map<String, Object> json = new HashMap<String, Object>();
		json.put("test", "test1");
		json.put("test2", 2);
		
		
		return json;
	}
	/*AJAX String 예*/
	@RequestMapping("/test/testApi2.do")
	@ResponseBody
	public String ajaxString(Model model,HttpServletRequest req, HttpServletResponse resp) throws IOException {

		return "내용";
	}
	@RequestMapping("/test/fileUpload.do")
	public String fileUpload(Model model,MultipartRequest mreq) {
		Iterator<String> names = mreq.getFileNames();
		
		while(names.hasNext()) {			
			System.out.println(names.next());
			System.out.println(((CommonsMultipartFile)mreq.getFile("file")).getSize());
			System.out.println(((CommonsMultipartFile)mreq.getFile("file")).getOriginalFilename());
		}
		return null;
	}
}
