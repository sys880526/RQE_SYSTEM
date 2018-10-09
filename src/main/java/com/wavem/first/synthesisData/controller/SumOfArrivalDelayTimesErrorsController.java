package com.wavem.first.synthesisData.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.synthesisData.service.SumOfArrivalDelayTimesErrorsService;

@Controller("SumOfArrivalDelayTimesErrorsController")
public class SumOfArrivalDelayTimesErrorsController {
	private static final Logger logger = LoggerFactory.getLogger(SumOfArrivalDelayTimesErrorsController.class);
	
	@Resource(name = "SumOfArrivalDelayTimesErrorsService")
	private SumOfArrivalDelayTimesErrorsService sumOfArrivalDelayTimesErrorsService;
	
	@RequestMapping(value = "/synthesisData/sumOfArrivalDelayTimesErrors", method = RequestMethod.GET)
	public ModelAndView getSumOfArrivalDelayTimesErrors(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		}
		mav.addObject("control", "synthesisData");
		mav.addObject("sub_Control", "synthesisData_sumOfArrivalDelayTimesErrors");
		mav.setViewName("synthesisData/sumOfArrivalDelayTimesErrors");
		return mav;
	}
	
	@RequestMapping(value = "/synthesisData/getSumOfArrivalDelayTimesErrorData", method = RequestMethod.POST)
	public ModelAndView getSumOfArrivalDelayTimesErrorData(HttpServletRequest request,HttpSession session) {
		ModelAndView mav =  new ModelAndView("jsonView");
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		String userid = session.getAttribute("SS_USER_ID").toString();
		
		Map<String, Object> input = new HashMap<String, Object>();
		input.put("start_date", startDate);
		input.put("end_date", endDate);
		input.put("userid", userid);
		List<Map<String, Object>> arrivalDelay = sumOfArrivalDelayTimesErrorsService.getSumOfArrivalDelayTimesErrors(input);
		List<Map<String, Object>> arrivalSchedule = sumOfArrivalDelayTimesErrorsService.getArrivalScheduledErrorCount(input);
		mav.addObject("arrivalDelay", arrivalDelay);
		mav.addObject("arrivalSchedule", arrivalSchedule);
		return mav;
	}
}
