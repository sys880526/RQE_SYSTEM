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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.detailsData.service.BmtIdReferenceSpecificService;


@Controller("BmtIdReferenceSpecificController")
public class BmtIdReferenceSpecificController {
	private static final Logger logger = LoggerFactory.getLogger(BmtIdReferenceSpecificController.class);
	
	@Resource(name = "BmtIdReferenceSpecificService")
	private BmtIdReferenceSpecificService bmtIdReferenceSpecificService;
	
	@RequestMapping(value = "/detailsData/bmtIdReferenceSpecific", method = RequestMethod.GET)
	public ModelAndView getBmtIdReferenceSpecific(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control", "detailsData_bmtIdReferenceSpecific");
		mav.setViewName("detailsData/bmtIdReferenceSpecific");		
		return mav;
	}
	
	@RequestMapping(value = "/detailsData/bmtIdReferenceSpecificData", method = RequestMethod.POST)
	public ModelAndView getBmtIdReferenceSpecificData(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		Map<String, Object> map = new HashMap<String, Object>();
		
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", "user01");
		
		//bmt id 기준 특이사항 by_time sql 		
		StringBuffer str_time = new StringBuffer();
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
		
		/*str_time.append(list_time.get(0));
		for (int i = 1; i < list_time.size(); i++) {
			str_time.append("," + list_time.get(i));
		}
		
		map.put("str_time", str_time.toString());*/
		
		System.out.println("by_time >>>>>>>>>>>" + by_time.toString());
		System.out.println("list_time >>>>>>>>>>>" + list_time.toString());
		System.out.println("str_time >>>>>>>>>>>" + str_time.toString());
		
		//bmt id 기준 특이사항 by_distance sql 		
		StringBuffer str_distance = new StringBuffer();
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
		
		/*str_distance.append(list_distance.get(0));
		for (int i = 1; i < list_distance.size(); i++) {
			str_distance.append("," + list_distance.get(i));
		}
		
		map.put("str_distance", str_distance.toString());*/
		
		System.out.println("by_distance >>>>>>>>>>>" + by_distance.toString());
		System.out.println("list_distance >>>>>>>>>>>" + list_distance.toString());
		System.out.println("str_distance >>>>>>>>>>>" + str_distance.toString());
		System.out.println("map >>>>>>>>>>>" + map);
		
		List<Map<String, Object>> result = bmtIdReferenceSpecificService.getBmtIdReferenceSpecificData(map);
		mav.addObject("out", result);
		System.out.println("result >>>>>>>>>>>" + result);
		return mav;
	}
}
