package com.wavem.first.home.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wavem.first.home.dao.HomeDao;
import com.wavem.first.home.service.HomeService;

@Repository("HomeService")
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeDao homeDao;
	
	@Override
	public List<Map<String, Object>> getBmtListEvent(Map<String, String> param) {
		
		System.out.println("SampleServiceImpl");
		
		return homeDao.selectBmtListEvent(param);
	}
	
}
