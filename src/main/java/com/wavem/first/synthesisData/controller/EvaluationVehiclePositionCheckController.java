package com.wavem.first.synthesisData.controller;

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

import com.wavem.first.synthesisData.service.EvaluationVehiclePositionCheckService;

@Controller("EvaluationVehiclePositionCheckController")
public class EvaluationVehiclePositionCheckController {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationVehiclePositionCheckController.class);

	@Resource(name= "EvaluationVehiclePositionCheckService")
	private EvaluationVehiclePositionCheckService evaluationVehiclePositionCheckService;
	
	@RequestMapping(value="/synthesisData/evaluationVehiclePositionCheck", method = RequestMethod.GET)
	public ModelAndView getEvaluationVehiclePositionCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("control", "synthesisData");
		mav.addObject("sub_Control", "synthesisData_evaluationVehiclePositionCheck");
		mav.setViewName("synthesisData/evaluationVehiclePositionCheck");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesisData/evaluationVehiclePositionCheckData", method = RequestMethod.POST)
	public ModelAndView getEvaluationVehiclePositionCheckData(HttpServletRequest request, HttpSession session
			, @RequestBody Map<String, Object> data) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		
		List<Map<String, Object>> out = evaluationVehiclePositionCheckService.getEvaluationVehiclePositionCheckData(data);
		mav.addObject("EvaluationVehiclePositionCheck", out);
		return mav;
	}
	
}
