package com.wavem.first.system.service.Impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.system.dao.SystemDao;
import com.wavem.first.system.service.SystemService;

@Service("SystemService")
public class SystemServiceImpl implements SystemService {
	private static final Logger logger = LoggerFactory.getLogger(SystemServiceImpl.class);
	
	@Autowired
	private SystemDao systemDao;
	
	@Override
	public List<Map<String, Object>> getUserManagementData(Map<String, Object> input) {
		return (List<Map<String, Object>>) systemDao.getUserManagementData(input);		
	}

}
