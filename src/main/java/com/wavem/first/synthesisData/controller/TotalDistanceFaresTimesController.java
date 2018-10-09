package com.wavem.first.synthesisData.controller;

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

import com.wavem.first.synthesisData.service.TotalDistanceFaresTimesService;


@Controller("TotalDistanceFaresTimesController")
public class TotalDistanceFaresTimesController {
	private static final Logger logger = LoggerFactory.getLogger(TotalDistanceFaresTimesController.class);
	
	@Resource(name = "TotalDistanceFaresTimesService")
	private TotalDistanceFaresTimesService totalDistanceFaresTimesService;
	
	@RequestMapping(value = "/synthesisData/totalDistanceFaresTimes", method = RequestMethod.GET)
	public ModelAndView getTotalDistanceFaresTimes(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();	
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		}
		mav.addObject("control", "synthesisData");
		mav.addObject("sub_Control", "synthesisData_totalDistanceFaresTimes");
		mav.setViewName("synthesisData/totalDistanceFaresTimes");	
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesisData/totalDistanceFaresTimesData", method = RequestMethod.POST)
	public ModelAndView getTotalDistanceFaresTimesData(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		String userid = session.getAttribute("SS_USER_ID").toString();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", userid);
		
		List<Map<String, Object>> out = totalDistanceFaresTimesService.getTotalDistanceFaresTimesData(map);
		mav.addObject("list", out);
		return mav;
	}
	
	
}
