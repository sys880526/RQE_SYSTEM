package com.wavem.first.detailsData.dao.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.detailsData.dao.BmtIdReferencePathAnalysisDao;

@Transactional
@Repository("BmtIdReferencePathAnalysisDao")
public class BmtIdReferencePathAnalysisDaoImpl implements BmtIdReferencePathAnalysisDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<Map<String, Object>> getBmtIdReferencePathAnalysisData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("bmtIdReferencePathAnalysis.getBmtIdReferencePathAnalysis", input);
	}

}
