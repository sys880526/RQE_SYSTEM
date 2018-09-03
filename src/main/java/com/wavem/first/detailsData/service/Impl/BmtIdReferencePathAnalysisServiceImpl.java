package com.wavem.first.detailsData.service.Impl;

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
	public List<Map<String, Object>> getBmtIdReferencePathAnalysisData(Map<String, Object> map) {
		return (List<Map<String, Object>>) bmtIdReferencePathAnalysisDao.getBmtIdReferencePathAnalysisData(map);
	}

}
