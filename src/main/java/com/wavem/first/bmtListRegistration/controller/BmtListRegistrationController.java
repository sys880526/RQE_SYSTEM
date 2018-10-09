package com.wavem.first.bmtListRegistration.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.bmtListRegistration.serivce.BmtListRegistrationService;

@Controller
public class BmtListRegistrationController {
	
	@Autowired
	private BmtListRegistrationService bmtListRegistrationService;
	
	@RequestMapping(value = "/bmtListRegistration/bmtListRegistration", method=RequestMethod.GET)
	public ModelAndView bmtListRegistration(HttpSession session) {
		ModelAndView mv = new ModelAndView("bmtListRegistration/bmtListRegistration");
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mv.setViewName("redirect:/");
		}
		mv.addObject("control", "bmtListRegistration");
		mv.addObject("sub_control", "bmtListRegistration.bmtListRegistration");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bmtListRegistration/getBmtHistoryList", method = RequestMethod.POST)
	public ModelAndView getBmtHistoryList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		String userid = session.getAttribute("SS_USER_ID").toString();
//		String userid = request.getParameter("userid");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", userid);
		List<Map<String, Object>> out = bmtListRegistrationService.getBmtHistoryList(map);
		mav.addObject("list", out);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bmtListRegistration/saveNewBmtList", method = RequestMethod.POST)
	public ModelAndView saveNewBmtList(HttpServletRequest request, HttpSession session
			, @RequestBody List<Map<String, Object>> saveData) {
		ModelAndView mav = new ModelAndView("jsonView");
		int resultCode = bmtListRegistrationService.saveNewBmtList(saveData);
		mav.addObject("code", resultCode);
		return mav;
	}
}