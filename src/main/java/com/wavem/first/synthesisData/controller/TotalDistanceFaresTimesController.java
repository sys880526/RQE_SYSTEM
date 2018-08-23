package com.wavem.first.synthesisData.controller;

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
	
	@RequestMapping(value = "/synthesize/totalDistanceFaresTimes", method = RequestMethod.GET)
	public ModelAndView getTotalDistanceFaresTimes(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("control", "totalDistanceFaresTimes");
		mav.setViewName("synthesize/totalDistanceFaresTimes");		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesize/totalDistanceFaresTimesData", method = RequestMethod.POST)
	public ModelAndView getTotalDistanceFaresTimesData(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", "user01");
		map.put("sub_Control", "synthesisData_dataSheet");
		map.put("sub_Control", "synthesisData_totalDistanceFaresTimes");
		map.put("sub_Control", "synthesisData_statusOfAssessmentSectionForeAftereffect");
		map.put("sub_Control", "synthesisData_sumOfArrivalDelayTimesErrors");
		List<Map<String, Object>> out = totalDistanceFaresTimesService.getTotalDistanceFaresTimesData(map);
		mav.addObject("list", out);
		return mav;
	}
	
	
}