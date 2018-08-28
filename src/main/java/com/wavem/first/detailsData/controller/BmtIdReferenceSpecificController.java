package com.wavem.first.detailsData.controller;

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

import com.wavem.first.detailsData.service.BmtIdReferenceSpecificService;


@Controller("BmtIdReferenceSpecificController")
public class BmtIdReferenceSpecificController {
	private static final Logger logger = LoggerFactory.getLogger(BmtIdReferenceSpecificController.class);
	
	@Resource(name = "BmtIdReferenceSpecificService")
	private BmtIdReferenceSpecificService bmtIdReferenceSpecificService;
	
	@RequestMapping(value = "/detailsData/bmtIdReferenceSpecific", method = RequestMethod.GET)
	public ModelAndView getSynthesizeData(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("control", "detailsData");
		mav.addObject("sub_Control", "detailsData_bmtIdReferenceSpecific");
		mav.setViewName("detailsData/bmtIdReferenceSpecific");		
		return mav;
	}
}
