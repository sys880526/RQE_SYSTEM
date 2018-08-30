package com.wavem.first.detailsData.service.Impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wavem.first.detailsData.dao.BmtIdReferenceSpecificDao;
import com.wavem.first.detailsData.service.BmtIdReferenceSpecificService;

@Service("BmtIdReferenceSpecificService")
public class BmtIdReferenceSpecificServiceImpl implements BmtIdReferenceSpecificService {
	private static final Logger logger = LoggerFactory.getLogger(BmtIdReferenceSpecificServiceImpl.class);

	@Autowired
	private BmtIdReferenceSpecificDao bmtIdReferenceSpecificDao;

	@Override
	public List<Map<String, Object>> getBmtIdReferenceSpecificData(Map<String, Object> input) {
		return bmtIdReferenceSpecificDao.getBmtIdReferenceSpecificData(input);
	}
}
