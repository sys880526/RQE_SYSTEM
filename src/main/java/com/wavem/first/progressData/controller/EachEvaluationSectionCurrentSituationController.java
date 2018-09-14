package com.wavem.first.progressData.controller;

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

import com.wavem.first.progressData.service.EachEvaluationSectionCurrentSituationService;

@Controller("EachEvaluationSectionCurrentSituationController")
public class EachEvaluationSectionCurrentSituationController {
	private static final Logger logger = LoggerFactory.getLogger(EachEvaluationSectionCurrentSituationController.class);
	
	@Resource(name = "EachEvaluationSectionCurrentSituationService")
	private EachEvaluationSectionCurrentSituationService eachEvaluationSectionCurrentSituationService;
	
	@RequestMapping(value = "/progressData/eachEvaluationSectionCurrentSituation", method = RequestMethod.GET)
	public ModelAndView getEachEvaluationSectionCurrentSituation(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		}
		String userid = session.getAttribute("SS_USER_ID").toString();
		Map<String, Object> input = new HashMap<String, Object>();
		input.put("userid", userid);
		mav.addObject("control", "progressData");
		mav.addObject("sub_control", "progressData_eachEvaluationSectionCurrentSituation");
		List<Map<String, Object>> out = eachEvaluationSectionCurrentSituationService.getEachEvaluationSectionCurrentSituationData(input);
		mav.addObject("list", out);
		mav.setViewName("progressData/eachEvaluationSectionCurrentSituation");
		return mav;
	}
}
