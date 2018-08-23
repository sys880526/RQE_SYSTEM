package com.wavem.first.bmtListRegistration.serivce.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.bmtListRegistration.dao.BmtListNewRegistrationDao;
import com.wavem.first.bmtListRegistration.serivce.BmtListNewRegistrationService;

@Service
public class BmtListNewRegistrationServiceImpl implements BmtListNewRegistrationService {
	@Autowired
	private BmtListNewRegistrationDao bmtListNewRegistrationDao;

	@Override
	public List<Map<String, Object>> getBmtNewHistoryList(Map<String, Object> map) {
		return bmtListNewRegistrationDao.getBmtNewHistoryList(map);
	}

	@Override
	public int deleteBmtNewList(List<Map<String, Object>> deleteData) {
		for(int i = 0; i < deleteData.size(); i++) {
			bmtListNewRegistrationDao.deleteBmtNewList(deleteData.get(i));
		}
		return 0;
	}
	@Transactional
	@Override
	public int bmtNewListsInsert(List<Map<String, Object>> saveData) {
		for(int i = 0; i < saveData.size(); i++) {
			bmtListNewRegistrationDao.bmtNewListsInsert(saveData.get(i));
		}
		return 0;
	}
	
}
