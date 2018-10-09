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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.detailsData.controller.PathDistanceController;
import com.wavem.first.detailsData.service.PathDistanceService;

@Controller("PathDistanceController")
public class PathDistanceController {
	private static final Logger logger = LoggerFactory.getLogger(PathDistanceController.class);
	
	@Resource(name="PathDistanceService")
	private PathDistanceService pathDistanceService;
	
	@RequestMapping(value = "/detailsData/pathDistance", method = RequestMethod.GET)
	public ModelAndView getPathDistance(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		}
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_pathDistance");
		mav.setViewName("detailsData/pathDistance");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/pathDistanceData", method = RequestMethod.GET)
	public ModelAndView getPathDistanceData(HttpServletRequest request, HttpSession session) {

		ModelAndView mav = new ModelAndView("jsonView");

		mav.addObject("code", "0");

		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		String userid = session.getAttribute("SS_USER_ID").toString();
		
		//시간대 특성 파라미터 셋팅
		List timeList = new ArrayList();

		if (request.getParameter("am_peak") != null && request.getParameter("am_peak") != ""){
			timeList.add("am_peak");
		}
		if (request.getParameter("pm_peak") != null && request.getParameter("pm_peak") != ""){
			timeList.add("pm_peak");
		}
		if (request.getParameter("am") != null && request.getParameter("am") != ""){
			timeList.add("am");
		}
		if (request.getParameter("am_non_peak") != null && request.getParameter("am_non_peak") != ""){
			timeList.add("am_non_peak");
		}
		if (request.getParameter("pm_non_peak") != null && request.getParameter("pm_non_peak") != ""){
			timeList.add("pm_non_peak");
		}
		if (request.getParameter("pm") != null && request.getParameter("pm") != ""){
			timeList.add("pm");
		}

		//거리별 특성 파라미터 셋팅
		List distanceList = new ArrayList();

		if (request.getParameter("shortest_distance") != null && request.getParameter("shortest_distance") != ""){
			distanceList.add("shortest_distance");
		}
		if (request.getParameter("short_distance") != null && request.getParameter("short_distance") != ""){
			distanceList.add("short_distance");
		}
		if (request.getParameter("medium_distance") != null && request.getParameter("medium_distance") != ""){
			distanceList.add("medium_distance");
		}
		if (request.getParameter("long_distance") != null && request.getParameter("long_distance") != ""){
			distanceList.add("long_distance");
		}
		if (request.getParameter("longest_distance") != null && request.getParameter("longest_distance") != ""){
			distanceList.add("longest_distance");
		}

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("code", "0");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", userid);

		if (timeList.size() != 0){
			map.put("time_list", timeList);
		}
		if (distanceList.size() != 0){
			map.put("distance_list", distanceList);
		}
		
		List<Map<String, Object>> list = pathDistanceService.getPathDistanceData(map);
		List<Map<String, Object>> chartList = pathDistanceService.getPathDistanceChartData(map);

		mav.addObject("list", list);
		mav.addObject("chart", chartList);

		return mav;
	}
}
