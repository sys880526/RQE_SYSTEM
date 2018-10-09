package com.wavem.first.login.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
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
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws IOException {

		logger.info("========LoginController.doLoginUser 시작=======");

		ModelAndView mav = new ModelAndView();
		UserInfoVo userInfo = new UserInfoVo();

		List<UserInfoVo> userInfoList = null; // 초기화
		HttpSession session = request.getSession();

		userInfo.setUserId(request.getParameter("userId"));
		userInfo.setUserPass(request.getParameter("userPass"));

		userInfoList = loginService.login(userInfo);
		Map<String, Object> msg = new HashMap<String, Object>();
		
		if (userInfoList.size() > 0) {
			userInfo = userInfoList.get(0);

			// session setting
			session.setAttribute("SS_USER_ID", userInfo.getUserId()); // 사용자ID
			session.setAttribute("SS_CP", userInfo.getCp()); // 사용자CP
			session.setAttribute("SS_CAR_INFO", userInfo.getCarinfo()); // 사용자 차량정보
			session.setAttribute("SS_AUCODE", userInfo.getAucode()); // AU코드
			mav.addObject("userInfoList", userInfoList);
			System.out.println("권한 >>>>> " + session.getAttribute("SS_AUCODE").toString());
			mav.setViewName("redirect:/main");
		} else {
			msg.put("msg", "입력하신 아이디, 패스워드가 정확하지 않습니다.");
//			mav.addObject("msg", msg);
			
//			mav.setViewName("redirect:/");
			
			mav.addObject("loginflag","false");
			mav.setViewName("/login/login");
		}
		logger.info("========LoginController.doLoginUser 종료=======");
		return mav;
	}
	
	@RequestMapping(value = "/login/logoutUser", method = RequestMethod.GET)
	public ModelAndView logoutUser(HttpServletRequest request, HttpServletResponse response) {

		logger.info("========LoginController.doLoginUser 시작=======");

		ModelAndView mav = new ModelAndView();
		
		// session setting
		HttpSession session = request.getSession();
		session.setAttribute("SS_USER_ID", null); // 사용자ID
		session.setAttribute("SS_CP", null); // 사용자CP
		session.setAttribute("SS_CAR_INFO", null);
		session.setAttribute("SS_AUCODE", null); 
		
		//mav.addObject("gubun", "관리자");
		mav.setViewName("redirect:/");

		return mav;
	}
}
