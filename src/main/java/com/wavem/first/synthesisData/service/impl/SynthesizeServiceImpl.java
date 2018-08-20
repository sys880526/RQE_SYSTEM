package com.wavem.first.synthesisData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.synthesisData.dao.SynthesizeDao;
import com.wavem.first.synthesisData.service.SynthesizeService;

@Service("SynthesizeService")
public class SynthesizeServiceImpl implements SynthesizeService {
	private static final Logger logger = LoggerFactory.getLogger(SynthesizeServiceImpl.class);
	
	@Autowired
	private SynthesizeDao synthesizeDao;

	public List<Map<String, Object>> getDataSheetList(Map<String, Object> input) {
		return (List<Map<String, Object>>) synthesizeDao.getDataSheetList(input);
	}

	public Map<String, Object> getDetailDataSheet(Map<String, Object> input) {
		return synthesizeDao.getDetailDataSheet(input);
	}
	
}
