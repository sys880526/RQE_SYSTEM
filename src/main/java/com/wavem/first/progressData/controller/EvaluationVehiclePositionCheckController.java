package com.wavem.first.progressData.controller;

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

import com.wavem.first.progressData.service.EvaluationVehiclePositionCheckService;

@Controller("EvaluationVehiclePositionCheckController")
public class EvaluationVehiclePositionCheckController {
	private static final Logger logger = LoggerFactory.getLogger(EvaluationVehiclePositionCheckController.class);

	@Resource(name= "EvaluationVehiclePositionCheckService")
	private EvaluationVehiclePositionCheckService evaluationVehiclePositionCheckService;
	
	@RequestMapping(value="/progressData/evaluationVehiclePositionCheck", method = RequestMethod.GET)
	public ModelAndView getEvaluationVehiclePositionCheck(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		}
		mav.addObject("control", "progressData");
		mav.addObject("sub_control", "progressData_evaluationVehiclePositionCheck");
		mav.setViewName("progressData/evaluationVehiclePositionCheck");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/progressData/evaluationVehiclePositionCheckData", method = RequestMethod.POST)
	public ModelAndView getEvaluationVehiclePositionCheckData(HttpServletRequest request, HttpSession session
			, @RequestBody Map<String, Object> data) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		List<Map<String, Object>> out = evaluationVehiclePositionCheckService.getEvaluationVehiclePositionCheckData(data);
		mav.addObject("EvaluationVehiclePositionCheck", out);
		return mav;
	}
	
}
