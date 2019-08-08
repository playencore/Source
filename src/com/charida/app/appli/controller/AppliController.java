package com.charida.app.appli.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.charida.app.appli.service.AppliService;
import com.charida.app.common.controller.CommonController;
import com.charida.app.common.service.TestService;

@Controller
public class AppliController extends CommonController{
	protected Log log = LogFactory.getLog(TestService.class);
	@Resource
	private AppliService appliService;
	
	// 1-1.구매자 입장에서 매칭 신청중인 건을 보는 페이지(기본 정보 페이지)
	@RequestMapping("/service/cus-app-list.do")
	public String cusapp(HttpServletRequest req,HttpServletResponse resp) {
		req.setAttribute("appliList", appliService.getList(getParameterMap(req,true), req));
		return "/service/cus-app-list";
	}
	// 1-2-1.구매자가 보는 상세페이지에 보여줄 정보를 갖고옴(list1 신청 정보, list2 제안 정보)
	@RequestMapping("/appli/getDetailInfoList.do")
	@ResponseBody
	public Map<String, Object> getAppliInfoList(@RequestParam("appliId") String appliId) {
		log.debug("ctrler appliId : " + appliId);
		Map<String, Object>result = appliService.getAppliInfo(appliId);
		
		return result;
	} 
	@RequestMapping("/appli/get-menu-info.do")
	@ResponseBody
	public List<Map<String, Object>> getmenuinfo(@RequestParam("suggId") String suggId) {
		log.debug("ctrler suggId : " + suggId);
		return appliService.getMenuInfo(suggId);
	} 
	// 1-2-2.구매자가 업체를 채택함
	@RequestMapping("/appli/selectCustomer.do")
	@ResponseBody
	public int setStateAppSugg(@RequestParam("suggId") String suggId
							,@RequestParam("total") String total
							,@RequestParam("servId") String servId
			) {
		log.debug("ctrler suggId : " + suggId);
		log.debug("ctrler total : " + total);
		log.debug("ctrler servId : " + servId);
		int result = appliService.setStateAppSuggTx(suggId, total, servId);
		log.debug("result : " + result);
		return result;
	} 
	
	// 모달창에서 비교하기 버튼을 누름
		@RequestMapping("/appli/getReviewAvgScore.do")
		@ResponseBody
		public List<Map<String, Object>> getReviewAvgScore(@RequestParam("suggIdList") String suggIdList) {
			log.debug("ctrler appliId : " + suggIdList);
			List<Map<String, Object>> result = appliService.getReviewAvgScore(suggIdList);
			
			return result;
		} 
}
