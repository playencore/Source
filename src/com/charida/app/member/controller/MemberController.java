package com.charida.app.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.common.service.TestService;
import com.charida.app.member.dto.MemberDto;
import com.charida.app.member.service.MemberService;

@Controller
public class MemberController {
	protected Log log = LogFactory.getLog(TestService.class);

	@Resource
	MemberService memberService;

	@RequestMapping("/member/modifyinfo.do")
	public String modifyInfo(HttpServletRequest req, HttpServletResponse resp) {
		String mem_id = (String) req.getSession().getAttribute("session_id");
		log.debug("-------" + mem_id + "-----------");
		MemberDto dto = memberService.getMember(mem_id);
		req.setAttribute("meminfo", dto);
		return "/customer/modifyinfo";
	}

	@RequestMapping("/member/updateinfo.do")
	public String updateMemberInfo(HttpServletRequest req, HttpServletResponse resp) {
		MemberDto dto = new MemberDto();
		dto.setMem_id(req.getParameter("mem_id"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setName(req.getParameter("name"));
		dto.setEmail(req.getParameter("email"));
		dto.setZipcode(req.getParameter("zipcode"));
		dto.setAddress(req.getParameter("address"));
		dto.setAddress_detail(req.getParameter("address_detail"));
		dto.setTel(req.getParameter("tel"));
		dto.setBirth_date(req.getParameter("birth_date"));
		dto.setJob(req.getParameter("job"));
		int result = memberService.updateMemeberInfo(dto);
		String resultstr = "";
		if (result == 0) {
			resultstr = "정보 수정이 실패했습니다. 다시 시도해주세요.";
		} else {
			resultstr = "정보 수정이 완료되었습니다.";
		}
		req.setAttribute("resultstr", resultstr);
		return "/customer/modifyinfoPro";
	}

	@RequestMapping("/member/findid.do")
	public String FindMemberId(HttpServletRequest req, HttpServletResponse resp) {

		return "/customer/findId";
	}
	@RequestMapping("/member/getemailyn.do")
	@ResponseBody
	public Map<String, Object>getEmailYN(HttpServletRequest req, HttpServletResponse resp){
		System.out.println("ajax 이벤트 발생");
		Map<String,Object> resultMap = new HashMap<String, Object>();
		String email = req.getParameter("inemail") ;
		int result =  memberService.getEmailYN(email) ;
		if(result == 0) {
			resultMap.put("result", "가입한 이메일이 없습니다.") ;
			resultMap.put("flag", "0") ;
		}else {
			resultMap.put("result", "가입한 이메일로 인증번호를 보냅니다.") ;
			resultMap.put("flag", "1") ;
		}
		return resultMap ;
	}
	
	@RequestMapping("/member/getmemidtoemail.do")
	@ResponseBody
	public Map<String,Object>getIdtoEmail(HttpServletRequest req, HttpServletResponse resp){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String email = req.getParameter("inemail") ;
		List<String> mem_id = memberService.getMemIdToEmail(email);
		if(mem_id.size() == 0) {
			resultMap.put("result", "값이 없습니다.");
		}else {
			resultMap.put("result", "값을 보여줍니다") ;
			resultMap.put("mem_id", mem_id) ;
		}
		return resultMap ;
	}
	
	@RequestMapping("/member/findmemberpassowrd.do")
	public String findMemberPassword(HttpServletRequest req, HttpServletResponse resp) {
		
		return "/customer/findPassword" ;
	}
	@RequestMapping("/member/checkMem_idDB.do")
	@ResponseBody
	public Map<String, Object> checkMem_idDB(HttpServletRequest req, HttpServletResponse resp){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String mem_id = req.getParameter("inmem_id") ;
		resultMap = memberService.getMemIdYN(mem_id);
		return resultMap ;
	}
	@RequestMapping("/member/getEmail.do")
	@ResponseBody
	public Map<String,Object> getEmail(HttpServletRequest req, HttpServletResponse resp){
		return memberService.getEmail(req.getParameter("mem_id"));
	}
	@RequestMapping("/member/getpasswd.do")
	@ResponseBody
	public Map<String, Object> getPasswd(HttpServletRequest req, HttpServletResponse resp){
		return memberService.getPasswd(req.getParameter("inmem_id"));
	}
	

}
