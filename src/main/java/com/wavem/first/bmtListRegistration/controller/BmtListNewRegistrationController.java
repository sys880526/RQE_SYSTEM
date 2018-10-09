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

import com.wavem.first.bmtListRegistration.serivce.BmtListNewRegistrationService;

@Controller
public class BmtListNewRegistrationController {
	
	@Autowired
	private BmtListNewRegistrationService bmtListNewRegistrationService;
	
	@RequestMapping(value = "/bmtListRegistration/bmtNewList", method=RequestMethod.GET)
	public ModelAndView bmtNewList(HttpSession session) {
		ModelAndView mv = new ModelAndView("bmtListRegistration/bmtListNewRegistration");
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mv.setViewName("redirect:/");
		}
		mv.addObject("control", "bmtListRegistration");
		mv.addObject("sub_control", "bmtListRegistration.bmtNewList");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bmtListRegistration/getBmtNewList", method = RequestMethod.POST)
	public ModelAndView getBmtHistoryList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		String date = request.getParameter("bmt-date");
		String userid = session.getAttribute("SS_USER_ID").toString();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		map.put("date", date);
		map.put("userid", userid);
		List<Map<String, Object>> out = bmtListNewRegistrationService.getBmtNewHistoryList(map);
		mav.addObject("list", out);
		System.out.println(session.getAttribute("SS_USER_ID"));
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bmtListRegistration/deleteBmtNewList", method = RequestMethod.POST)
	public ModelAndView deleteBmtNewList(HttpServletRequest request, HttpSession session
			, @RequestBody List<Map<String, Object>> deleteData) {
		ModelAndView mav = new ModelAndView("jsonView");
		int resultCode = bmtListNewRegistrationService.deleteBmtNewList(deleteData);
		mav.addObject("code", resultCode);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/bmtListRegistration/bmtNewListsInsert", method = RequestMethod.POST)
	public ModelAndView bmtNewListsInsert(HttpServletRequest request, HttpSession session
			, @RequestBody List<Map<String, Object>> saveData) {
		ModelAndView mav = new ModelAndView("jsonView");
		int resultCode = bmtListNewRegistrationService.bmtNewListsInsert(saveData);
		mav.addObject("code", resultCode);
		return mav;
	}
}