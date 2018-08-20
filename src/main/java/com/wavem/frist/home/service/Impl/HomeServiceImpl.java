package com.wavem.frist.home.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wavem.frist.home.dao.HomeDao;
import com.wavem.frist.home.service.HomeService;

@Repository("HomeService")
public class HomeServiceImpl implements HomeService {

	@Autowired
	private HomeDao homeDao;
	
	@Override
	public List<Map<String, Object>> getBmtListEvent(String userid) {
		
		System.out.println("SampleServiceImpl");
		
		return homeDao.selectBmtListEvent(userid);
	}
	
}
