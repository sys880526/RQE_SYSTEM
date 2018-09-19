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
	
	@RequestMapping(value = "/system/userManagement", method = RequestMethod.GET)
	public ModelAndView getUserManagement(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();	
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		}
		mav.addObject("control", "userManagement");
		mav.addObject("sub_Control", "system_userManagement");
		mav.setViewName("system/userManagement");	
		return mav;
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/system/userManagementData", method = RequestMethod.POST)
//	public ModelAndView getUserManagementData(HttpServletRequest request, HttpSession session) {
//		ModelAndView mav = new ModelAndView("jsonView");
//		mav.addObject("code", "0");
//		String startDate = request.getParameter("bmt-start-date");
//		String endDate = request.getParameter("bmt-end-date");
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("code", "0");
//		map.put("start_date", startDate);
//		map.put("end_date", endDate);
//		map.put("userid", "user01");
//		
//		List<Map<String, Object>> out = systemService.getUserManagementData(map);
//		mav.addObject("list", out);
//		return mav;
//	}
	
}
