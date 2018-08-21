package com.wavem.first.synthesisData.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.wavem.first.synthesisData.dao.TotalDistanceFaresTimesDao;
import com.wavem.first.synthesisData.service.TotalDistanceFaresTimesService;

@Service("TotalDistanceFaresTimesService")
//@Repository("TotalDistanceFaresTimesService")
public class TotalDistanceFaresTimesServiceImpl implements TotalDistanceFaresTimesService {
	private static final Logger logger = LoggerFactory.getLogger(TotalDistanceFaresTimesServiceImpl.class);
	
	@Autowired
	private TotalDistanceFaresTimesDao totalDistanceFaresTimesDao;

	public List<Map<String, Object>> getTotalDistanceFaresTimesData(Map<String, Object> input) {
		return (List<Map<String, Object>>) totalDistanceFaresTimesDao.getTotalDistanceFaresTimesData(input);		
	}
	
}
