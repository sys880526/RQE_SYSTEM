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


@Controller("DataSheetController")
public class DataSheetController {
	private static final Logger logger = LoggerFactory.getLogger(DataSheetController.class);
	
	@Resource(name = "SynthesizeService")
	private SynthesizeService synthesizeService;
	
	@RequestMapping(value = "/synthesisData/datasheet", method = RequestMethod.GET)
	public ModelAndView getSynthesizeData(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		ModelAndView mav = new ModelAndView();		
		mav.addObject("control", "synthesisData");
		mav.addObject("sub_Control", "synthesisData_dataSheet");
		mav.setViewName("synthesisData/data_sheet");		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesisData/datasheetlist", method = RequestMethod.POST)
	public ModelAndView getDataSheetList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView("jsonView");
		mav.addObject("code", "0");
		String startDate = request.getParameter("bmt-start-date");
		String endDate = request.getParameter("bmt-end-date");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start_date", startDate);
		map.put("end_date", endDate);
		map.put("userid", "user01");
		List<Map<String, Object>> out = synthesizeService.getDataSheetList(map);
		mav.addObject("list", out);
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/synthesisData/detailData", method = RequestMethod.POST)
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
		return mav;		
	}
	
}
