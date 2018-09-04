package com.wavem.first.detailsData.controller;


import java.util.ArrayList;
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

import com.wavem.first.detailsData.service.ArrivalScheduledTimeErrorAndErrorRateService;
import com.wavem.first.detailsData.service.BmtIdReferencePathAnalysisService;


@Controller("BmtIdReferencePathAnalysisController")
public class BmtIdReferencePathAnalysisController {

	private static final Logger logger = LoggerFactory.getLogger(BmtIdReferencePathAnalysisController.class);

	@Resource(name="BmtIdReferencePathAnalysisService")
	private BmtIdReferencePathAnalysisService bmtIdReferencePathAnalysisService;
	
	@RequestMapping(value = "/detailsData/bmtIdReferencePathAnalysis", method = RequestMethod.GET)
	public ModelAndView getBmtIdReferencePathAnalysis(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_bmtIdReferencePathAnalysis");
		mav.setViewName("detailsData/bmtIdReferencePathAnalysis");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/getBmtIdList", method = RequestMethod.POST)
	public ModelAndView getBmtIdList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", "user01");
		
		//bmt id 기준 특이사항 by_time sql 		
		ArrayList<String> list_time = new ArrayList<String>();
		Map<String, Object> by_time = new HashMap<String, Object>();
		
		String am_peak = request.getParameter("am_peak");
		String am_non_peak = request.getParameter("am_non_peak");
		String pm_non_peak = request.getParameter("pm_non_peak");
		String pm_peak = request.getParameter("pm_peak");
		String am = request.getParameter("am");
		String pm = request.getParameter("pm");
		
		if (am_peak != null && am_peak != "") {
			by_time.put("am_peak", am_peak);
		}
		
		if (am_non_peak != null && am_non_peak != "") {
			by_time.put("am_non_peak", am_non_peak);
		}
		
		if (pm_non_peak != null && pm_non_peak != "") {
			by_time.put("pm_non_peak", pm_non_peak);
		}
		
		if (pm_peak != null && pm_peak != "") {
			by_time.put("pm_peak", pm_peak);
		}
		
		if (am != null && am != "") {
			by_time.put("am", am);
		}
		
		if (pm != null && pm != "") {
			by_time.put("pm", pm);
		}
		
		for (String value : by_time.keySet()) {
			list_time.add(value);
		}
		
		map.put("list_time", list_time);
		
		System.out.println("by_time >>>>>>>>>>>" + by_time.toString());
		System.out.println("list_time >>>>>>>>>>>" + list_time.toString());
		
		//bmt id 기준 특이사항 by_distance sql 		
		ArrayList<String> list_distance = new ArrayList<String>();
		Map<String, Object> by_distance = new HashMap<String, Object>();
		
		String shortest_distance = request.getParameter("shortest_distance");
		String short_distance = request.getParameter("short_distance");
		String medium_distance = request.getParameter("medium_distance");
		String long_distance = request.getParameter("long_distance");
		String longest_distance = request.getParameter("longest_distance");
		
		if (shortest_distance != null && shortest_distance != "") {
			by_distance.put("shortest_distance", shortest_distance);
		}
		
		if (short_distance != null && short_distance != "") {
			by_distance.put("short_distance", short_distance);
		}
		
		if (medium_distance != null && medium_distance != "") {
			by_distance.put("medium_distance", medium_distance);
		}
		
		if (long_distance != null && long_distance != "") {
			by_distance.put("long_distance", long_distance);
		}
		
		if (longest_distance != null && longest_distance != "") {
			by_distance.put("longest_distance", longest_distance);
		}
		
		for (String value : by_distance.keySet()) {
			list_distance.add(value);
		}
		
		map.put("list_distance", list_distance);
		
		System.out.println("by_distance >>>>>>>>>>>" + by_distance.toString());
		System.out.println("list_distance >>>>>>>>>>>" + list_distance.toString());
		System.out.println("map >>>>>>>>>>>" + map);
		
		List<Map<String, Object>> result = bmtIdReferencePathAnalysisService.getBmtIdList(map);
		mav.addObject("list", result);
		System.out.println("result >>>>>>>>>>>" + result);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/getBmtIdListDetail", method = RequestMethod.POST)
	public ModelAndView getBmtIdListDetail(HttpServletRequest request, HttpSession session
			, @RequestBody Map<String, Object> data) {
		ModelAndView mav = new ModelAndView("jsonView");
		
		Map<String, Object> result = bmtIdReferencePathAnalysisService.getBmtIdListDetail(data);
		mav.addObject("list", result);
		System.out.println("result >>>>>>>>>>>" + result);
		return mav;
	}
}
