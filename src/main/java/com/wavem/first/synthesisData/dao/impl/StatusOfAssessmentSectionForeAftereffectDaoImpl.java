package com.wavem.first.synthesisData.dao.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.synthesisData.dao.StatusOfAssessmentSectionForeAftereffectDao;
import com.wavem.first.synthesisData.service.StatusOfAssessmentSectionForeAftereffectService;

@Transactional
@Repository("StatusOfAssessmentSectionForeAftereffectDaoImpl")
public class StatusOfAssessmentSectionForeAftereffectDaoImpl implements StatusOfAssessmentSectionForeAftereffectDao {
	private static final Logger logger = LoggerFactory.getLogger(SynthesizeDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<Map<String, Object>> getStatusOfAssessmentSectionData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("statusOfAssessmentSectionForeAftereffect.statusOfAssessmentSectionData", input);
	}

	@Override
	public List<Map<String, Object>> getForeAftereffectData(Map<String, Object> input) {
		return sqlSessionTemplate.selectList("statusOfAssessmentSectionForeAftereffect.foreAftereffectData", input);
	}
	
}
