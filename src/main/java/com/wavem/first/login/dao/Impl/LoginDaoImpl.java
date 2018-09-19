package com.wavem.first.login.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wavem.first.login.dao.LoginDao;
import com.wavem.first.login.vo.UserInfoVo;


@Transactional
@Repository("LoginDaoImpl")
public class LoginDaoImpl implements LoginDao {

	private static final Logger logger = LoggerFactory
			.getLogger(LoginDaoImpl.class);
	
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void select(UserInfoVo indoorMap) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserInfoVo> login(UserInfoVo userInfo) {
		// TODO Auto-generated method stub
		logger.info("========LoginDaoImpl.login 시작=======");

		List<UserInfoVo> userInfoList = sqlSessionTemplate.selectList(
				"login.login", userInfo);

		int listSize = userInfoList.size();

		logger.info("========LoginDaoImpl.login 종료=======:" + listSize);

		return userInfoList;
	}
	
}
