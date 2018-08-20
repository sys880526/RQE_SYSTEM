package com.wavem.frist.bmtListRegistration.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class bmtListRegistrationController {
	
	@RequestMapping(value = "/bmtListRegistration/bmtListRegistration_1", method=RequestMethod.POST)
	public ModelAndView bmtListRegistration_1() {
		
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
}