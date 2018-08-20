package com.wavem.first.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import com.wavem.first.login.service.LoginService;
import com.wavem.first.login.vo.UserInfoVo;

@Controller("LoginController")
public class LoginController {

	private static final Logger logger = LoggerFactory
			.getLogger(LoginController.class);
	
	@Resource(name = "LoginServiceImpl")
	private LoginService loginService; // 실내지도데이터 서버
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@RequestMapping(value = "/login/login", method = RequestMethod.POST)
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) {

		logger.info("========LoginController.doLoginUser 시작=======");

		ModelAndView mav = new ModelAndView();

		UserInfoVo userInfo = new UserInfoVo();

//		String userLevel = "";
//
//		if (!ComUtil.isNull(request.getParameter("userLevel")))
//			userLevel = request.getParameter("userLevel");
//
		userInfo.setUserId(request.getParameter("userId"));
		userInfo.setUserPass(request.getParameter("userPass"));

		List<UserInfoVo> userInfoList = null;

		userInfoList = loginService.login(userInfo);

		if (userInfoList.size() > 0) {

			userInfo = userInfoList.get(0);

			// session setting
			HttpSession session = request.getSession();
//			session.setAttribute("SS_USER_LEVEL", userInfo.getUserLevel()); // 사용자구분
			session.setAttribute("SS_USER_ID", userInfo.getUserId()); // 사용자ID
			session.setAttribute("SS_USER_NM", userInfo.getUserName()); // 사용자명
//			session.setAttribute("SS_DEPARTMENT_CODE", userInfo.getDepartmentCode()); // 부서코드
			mav.addObject("userInfoList", userInfoList);
			
			 // 세션에 존재하는 Locale을 새로운 언어로 변경해준다.
			Locale locales = null;
			locales = Locale.KOREAN;
			session.setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locales);
			

			mav.addObject("loginflag", "true");

		} else {
			
			
		}

		mav.setViewName("redirect:/main.do");
		logger.info("========LoginController.doLoginUser 종료=======");
		
		
		return mav;
	}
	
}
