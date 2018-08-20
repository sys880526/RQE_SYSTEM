package com.wavem.first.home.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.home.service.HomeService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService homeService;
	
	@RequestMapping(value="/main.do", method = RequestMethod.GET)
	public ModelAndView home() throws Exception {
		
		ModelAndView mv = new ModelAndView("/main");
		
		List<Map<String, Object>> result_bmtListEvent = homeService.getBmtListEvent("userid");

//		 List<Map<String,Object>> result_list = new ArrayList<>();
		 List<String> result_list = new ArrayList<String>();
		
		 for(int i =0; i<result_bmtListEvent.size(); i++) {
			 result_list.add("'" + (Date) result_bmtListEvent.get(i).get("start_day") + "'");
		 }
		
		 
//		mv.addObject("bmtListEvent", result_bmtListEvent);	
		mv.addObject("bmtListEvent", result_list);	
		
		return mv;
		
	}
	
}
