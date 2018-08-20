package com.wavem.first.login.dao;

import java.util.List;

import com.wavem.first.login.vo.UserInfoVo;

public interface LoginDao {

public void select(UserInfoVo indoorMap);
	
	public List<UserInfoVo> login(UserInfoVo userInfo);
	
}
