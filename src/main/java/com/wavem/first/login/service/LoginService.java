package com.wavem.first.login.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wavem.first.login.vo.UserInfoVo;

@Service
public interface LoginService {

	public List<UserInfoVo> select(UserInfoVo indoorMap);

	public List<UserInfoVo> login(UserInfoVo userInfo);
}
