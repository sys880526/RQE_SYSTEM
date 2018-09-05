package com.wavem.first.detailsData.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.BmtIdReferencePathAnalysisDao;
import com.wavem.first.detailsData.service.BmtIdReferencePathAnalysisService;

@Service("BmtIdReferencePathAnalysisService")
public class BmtIdReferencePathAnalysisServiceImpl implements BmtIdReferencePathAnalysisService {

	@Autowired
	private BmtIdReferencePathAnalysisDao bmtIdReferencePathAnalysisDao;

	@Override
	public List<Map<String, Object>> getBmtIdList(Map<String, Object> map) {
		return bmtIdReferencePathAnalysisDao.getBmtIdList(map);
	}

	@Override
	public Map<String, Object> getBmtIdListDetail(Map<String, Object> map) {
		Map<String, Object> resultMap = new HashMap<String, Object>();		
		// table data 
		List<Map<String, Object>> analysisList = bmtIdReferencePathAnalysisDao.getAnalysisList(map);
		// userList ( group by bmtid, userid user 구분을 위한 group by )  
		List<Map<String, Object>> userList = bmtIdReferencePathAnalysisDao.getUserList(map);
		
		// gpsList
		List<List<Map<String, Object>>> gpsDataList = new ArrayList<List<Map<String, Object>>>();
		for(int i = 0; i < userList.size(); i++) {
			gpsDataList.add(bmtIdReferencePathAnalysisDao.getGpsList(userList.get(i)));
		}
		
		resultMap.put("analysisList", analysisList);
		resultMap.put("userList", userList);
		resultMap.put("gpsDataList", gpsDataList);
		
		return resultMap;
	}

}
