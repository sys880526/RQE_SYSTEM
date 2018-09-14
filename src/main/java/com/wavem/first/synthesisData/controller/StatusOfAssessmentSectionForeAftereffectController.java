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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.synthesisData.service.StatusOfAssessmentSectionForeAftereffectService;
import com.wavem.first.synthesisData.service.SynthesizeService;

@Controller("StatusOfAssessmentSectionForeAftereffectController")
public class StatusOfAssessmentSectionForeAftereffectController {
	private static final Logger logger = LoggerFactory.getLogger(StatusOfAssessmentSectionForeAftereffectController.class);
	
	@Resource(name = "StatusOfAssessmentSectionForeAftereffectService")
	private StatusOfAssessmentSectionForeAftereffectService statusOfAssessmentSectionForeAftereffectService;
	
	@RequestMapping(value = "/synthesisData/statusOfAssessmentSectionForeAftereffect", method = RequestMethod.GET)
	public ModelAndView getStatusOfAssessmentSectionForeAftereffect(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//session check
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mav.setViewName("redirect:/");
		}
		mav.addObject("control", "synthesisData");
		mav.addObject("sub_Control", "synthesisData_statusOfAssessmentSectionForeAftereffect");
		mav.setViewName("synthesisData/statusOfAssessmentSectionForeAftereffect");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesisData/getStatusOfAssessmentSectionForeAftereffectData", method = RequestMethod.POST)
	public ModelAndView getStatusOfAssessmentSectionForeAftereffectData(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", "user01");
		List<Map<String, Object>> dayTime = statusOfAssessmentSectionForeAftereffectService.getStatusOfAssessmentSectionData(map);
		List<Map<String, Object>> foreAfter =  statusOfAssessmentSectionForeAftereffectService.getForeAftereffectData(map);
		mav.addObject("dayTime", dayTime);
		mav.addObject("foreAfter", foreAfter);
		System.out.println("foreAfter>>>>>>>" + foreAfter.toString());
		return mav;
	}
}
