package com.wavem.first.bmtListRegistration.serivce.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.bmtListRegistration.dao.BmtListRegistrationDao;
import com.wavem.first.bmtListRegistration.serivce.BmtListRegistrationService;

@Service
public class BmtListRegistrationServiceImpl implements BmtListRegistrationService{

	@Autowired
	private BmtListRegistrationDao bmtListRegistrationDao;
	
	@Override
	public List<Map<String, Object>> getBmtHistoryList(Map<String, Object> map) {
		return bmtListRegistrationDao.getBmtHistoryList(map);
	}

	@Override
	@Transactional
	public int saveNewBmtList(List<Map<String, Object>> saveData) {
		// bmt_list_new 테이블에 동일한 bmtid 와 userid  값을 가진 데이터가 존재 하는지 확인한다.
		for(int i = 0; i < saveData.size(); i++) {
			Map<String, Object> bmtIdCheck = bmtListRegistrationDao.checkBmtId(saveData.get(i));
			// bmtid 와 userid가 동일한 값을 찾아 0이 아닐경우 ( 키값이 겹칠경우 ) insert를 실행하지 않고 오류 코드를 전달한다.
			if(Integer.parseInt(bmtIdCheck.get("count").toString()) != 0) {
				return 1;
			}
		}
		
		// 데이터 베이스에 저장 할떼 데이터 베이스 관련 오류가 발생하면 에러 코드값을 2로 전달한다.
		try {
			bmtListRegistrationDao.saveNewBmtList(saveData);
		}catch(Exception e){
			return 2;
		}
		
		return 0;	// 데이터 입력이 성공하면 코드값을 0 으로 전달한다.
	}

}
