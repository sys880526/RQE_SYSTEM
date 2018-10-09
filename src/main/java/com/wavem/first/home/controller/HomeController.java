package com.wavem.first.home.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.wavem.first.home.service.HomeService;

import net.sf.json.JSONObject;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService homeService;
	
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) throws Exception {
		
		ModelAndView mv = new ModelAndView("/main");
		String userid = session.getAttribute("SS_USER_ID").toString();
		
		System.out.println("userid ::: >>>> " + userid);

		Map<String, String> param = new HashMap<String, String>();
		
		if (session.getAttribute("SS_USER_ID").toString().isEmpty()
				|| session.getAttribute("SS_CP").toString().isEmpty()
				|| session.getAttribute("SS_CAR_INFO").toString().isEmpty()
				|| session.getAttribute("SS_AUCODE").toString().isEmpty()) {
			mv.setViewName("redirect:/");
		}
		param.put("userid", userid);
		List<Map<String, Object>> result_bmtListEvent = homeService.getBmtListEvent(param);

		// ----------------------- modify 2018-08-20 ys880526 start ----------------------------------
		// 아래의 로직은 result_bmtListEvent 에서 가져오는 데이터가 정렬 되어 있다는 가정하에 작업
		// 월별 구분을 위한 map 생성 ( 키값으로 월을 구분 )
		Map<String, List<String>> result_map = new HashMap<String, List<String>>();
		
		int month = 0;
		// 월별 데이터를 담을 리스트 생성
		List<String> month_div_list = new ArrayList<String>();
		for(int i =0; i<result_bmtListEvent.size(); i++) {
			// 데이터의 월을 확인
			int monthSub = Integer.parseInt(result_bmtListEvent.get(i).get("start_day").toString().substring(5, 7));
			// 이전 데이터와 현재 데이터의 월을 비교하여 구분
			if(month != monthSub) {
				// month 값이 초기 값인 0 이 아니라면 월별 데이터를 구분해야 할수 있으므로 map에 데이터를 저장후 월별 구분 리스트를 초기화 
				if(month != 0) {
					result_map.put("month" + month, month_div_list);
					month_div_list = new ArrayList<String>();
				}
				// 이전데이터가 해당 월의 마지막 데이터 이므로 현재 데이터의 월로 변경
				month = monthSub;
			}
			// 월별 구분 리스트에 데이터를 입력
			month_div_list.add(result_bmtListEvent.get(i).get("start_day").toString());
			// for 문의 마지막일 경우 map 에 데이터를 입력할수 없으므로 로직 추가
			if(i == result_bmtListEvent.size() - 1) {
				result_map.put("month" + month, month_div_list);
			}
		}
		
		// map 형태의 데이터를 json 형태로 변경 하여 전달하기 위해 선언
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("result", result_map);
		// 메뉴 선택 부분 구분을 위한 control 추가 
		mv.addObject("control", "main");
		mv.addObject("bmtListEvent", jsonobj);
		// ----------------------- modify 2018-08-20 ys880526 end ----------------------------------
		
		return mv;
		
	}
	
}
