package com.wavem.frist.login.dao;

import java.util.List;

import com.wavem.frist.login.vo.UserInfoVo;

public interface LoginDao {

public void select(UserInfoVo indoorMap);
	
	public List<UserInfoVo> login(UserInfoVo userInfo);
	
}
