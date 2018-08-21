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

import com.wavem.first.synthesisData.service.SynthesizeService;


@Controller("SynthesizeController")
public class SynthesizeController {
	private static final Logger logger = LoggerFactory.getLogger(SynthesizeController.class);
	
	@Resource(name = "SynthesizeService")
	private SynthesizeService synthesizeService;
	
	@RequestMapping(value = "/synthesize/datasheet", method = RequestMethod.GET)
	public ModelAndView getSynthesizeData(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("control", "datasheet");
		mav.setViewName("synthesize/data_sheet");		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesize/datasheetlist", method = RequestMethod.POST)
	public ModelAndView getDataSheetList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("code", "0");
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", "user01");
		List<Map<String, Object>> out = synthesizeService.getDataSheetList(map);
		mav.addObject("list", out);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesize/detailData", method = RequestMethod.POST)
	public ModelAndView getDetailDataSheet(HttpServletRequest request, HttpSession session) {
		ModelAndView mav= new ModelAndView("jsonView");
		String bmtid = request.getParameter("bmtid");
		String cp = request.getParameter("cp");		
		Map<String, Object> input = new HashMap<String, Object>();	
		input.put("bmtid", bmtid);
		input.put("cp", cp);
		input.put("userid", "user01");
		Map<String, Object> out = synthesizeService.getDetailDataSheet(input);
		mav.addObject("data", out);
		System.out.println("data >>>>>>>>>>>>>>>>" + out);
		System.out.println("yugoinfo >>>>>>>>>>>>>>>>" + out.get("yugoinfo"));
		return mav;		
	}
	
}
