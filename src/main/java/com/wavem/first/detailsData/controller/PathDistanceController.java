package com.wavem.first.detailsData.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.detailsData.controller.PathDistanceController;
import com.wavem.first.detailsData.service.PathDistanceService;

@Controller("PathDistanceController")
public class PathDistanceController {
	private static final Logger logger = LoggerFactory.getLogger(PathDistanceController.class);
	
	@Resource(name="PathDistanceService")
	private PathDistanceService pathDistanceService;
	
	@RequestMapping(value = "/detailsData/pathDistance", method = RequestMethod.GET)
	public ModelAndView getPathDistance(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control","detailsData_pathDistance");
		mav.setViewName("detailsData/pathDistance");
		return mav;
	}
}
