package com.wavem.first.detailsData.controller;

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

import com.wavem.first.detailsData.service.ArrivalScheduledTimeErrorAndErrorRateService;

@Controller("ArrivalScheduledTimeErrorAndErrorRateController")
public class ArrivalScheduledTimeErrorAndErrorRateController {

	private static final Logger logger = LoggerFactory.getLogger(ArrivalScheduledTimeErrorAndErrorRateController.class);

	@Resource(name="ArrivalScheduledTimeErrorAndErrorRateService")
	private ArrivalScheduledTimeErrorAndErrorRateService arrivalScheduledTimeErrorAndErrorRateService;
	
	@RequestMapping(value = "/detailsData/arrivalScheduledTimeErrorAndErrorRate", method = RequestMethod.GET)
	public ModelAndView getArrivalScheduledTimeErrorAndErrorRate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_arrivalScheduledTimeErrorAndErrorRate");
		mav.setViewName("detailsData/arrivalScheduledTimeErrorAndErrorRate");
		return mav;
}
	
	@ResponseBody
	@RequestMapping(value = "/detailsData/arrivalScheduledTimeErrorAndErrorRateData", method = RequestMethod.POST)
	public ModelAndView getArrivalScheduledTimeErrorAndErrorRateData(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", "user01");
		
		List<Map<String, Object>> out = arrivalScheduledTimeErrorAndErrorRateService.getArrivalScheduledTimeErrorAndErrorRateData(map);
		mav.addObject("list", out);
		return mav;
	}
}
