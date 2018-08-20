package com.wavem.frist.login.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wavem.frist.login.vo.UserInfoVo;

@Service
public interface LoginService {

	public List<UserInfoVo> select(UserInfoVo indoorMap);

	public List<UserInfoVo> login(UserInfoVo userInfo);
}
