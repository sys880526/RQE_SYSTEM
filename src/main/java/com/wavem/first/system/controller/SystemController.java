package com.wavem.first.system.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.system.service.SystemService;

@Controller("SystemController")
public class SystemController {
	private static final Logger logger = LoggerFactory.getLogger(SystemController.class);
	
	@Resource(name = "SystemService")
	private SystemService systemService;
	
	// 페이지 접속 구현 Method
	@RequestMapping(value = "/system/userManagement", method = RequestMethod.GET)
	public ModelAndView getUserManagement(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();	
		//session check
		// session.getAttribute("SS_USER_ID") != NULL && session.getAttribute("SS_USER_ID") != ''
		System.out.println(session.getAttribute("SS_USER_ID"));
		if (session.getAttribute("SS_USER_ID") == null
				|| "".equals(session.getAttribute("SS_USER_ID"))
				|| session.getAttribute("SS_CP") == null
				|| "".equals(session.getAttribute("SS_CP"))
				|| session.getAttribute("SS_CAR_INFO") == null
				|| "".equals(session.getAttribute("SS_CAR_INFO"))
				|| session.getAttribute("SS_AUCODE") == null
				|| "".equals(session.getAttribute("SS_AUCODE"))) {
//		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
//				|| session.getAttribute("SS_CP").toString().isEmpty()
//				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
//				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		} else {
			mav.addObject("control", "userManagement");
			mav.addObject("sub_Control", "system_userManagement");
			mav.setViewName("system/userManagement");	
		}
		return mav;
	}
	
	// 데이터 값 표출 구현 Method
	@ResponseBody
	@RequestMapping(value = "/system/userManagementData", method = RequestMethod.POST)
	public ModelAndView getUserManagementData(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		String userid = session.getAttribute("SS_USER_ID").toString();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userid", userid);
		System.out.println("세션ID 값 >>>>>>>>>>>>>>>  " + userid);
		List<Map<String, Object>> out = systemService.getUserManagementData(map);

		mav.addObject("list", out);
		mav.addObject("code", "0");
		return mav;
	}
	
	// Default 데이터 값 표출 구현 Method (초기화 버튼 클릭시 셋팅 값)
	@ResponseBody
	@RequestMapping(value = "/system/userManagementDefaultData", method = RequestMethod.POST)
	public ModelAndView getUserManagementDefaultData(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> out = systemService.getUserManagementDefaultData(map);

		mav.addObject("defaultList", out);
		mav.addObject("code", "0");
		return mav;
	}
//	 Update된 데이터 값 표출 구현 Method (저장하기 버튼)
	@ResponseBody
	@RequestMapping(value = "/system/userManagementUpdateData", method = RequestMethod.POST)
	public ModelAndView getUserManagementUpdateData(HttpServletRequest request, HttpSession session
			, @RequestBody Map<String, Object> updateData) {
		ModelAndView mav = new ModelAndView("jsonView");
		int resultCode = 0;
		System.out.println(updateData.get("am_peak_start"));
		if("".equals(session.getAttribute("SS_USER_ID")) 
				|| session.getAttribute("SS_USER_ID") == null) {
			// resultCode 가 3일때는 세션에 아이디가 안잡혀 있는 경우 
			resultCode = 3;
		} else {
			updateData.put("userid", session.getAttribute("SS_USER_ID").toString());
			resultCode = systemService.getUserManagementUpdateData(updateData); 
			System.out.println(resultCode);
		}
		mav.addObject("code", resultCode);
		return mav;
	}
	
}
