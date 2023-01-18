package com.multi.cdb.house;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/house")
public class BuyController {

	@Autowired
	BuyService by_service;

	// 쿼리 파라미터를 광역시로 요청함.
	@RequestMapping(value = "/sale_city", method = { RequestMethod.GET })
	@ResponseBody
	public Object sel_list(@RequestParam("by_brtc") String by_brtc) {
		List<BuyVO> list = by_service.city(by_brtc);
		return list;
	}

	// 쿼리 파라미터를 공고아이디와 광역시로 요청함.
	// 다중 파라미터라서 Map(HashMap)으로 받음.
	@RequestMapping(value = "sale_view", method = { RequestMethod.GET })
	public Object sel_list2(@RequestParam("by_pbid") String by_pbid, @RequestParam("by_brtc") String by_brtc,
			Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("by_pbid", by_pbid);
		map.put("by_brtc", by_brtc);
		List<BuyVO> list = by_service.detail(map);
		model.addAttribute("list", list);
		return list;
	}

	// 전국 전체 데이터 조회
	@RequestMapping(value = "sale_all", method = { RequestMethod.GET })
	@ResponseBody
	public Object all() {
		List<BuyVO> list = by_service.all();
		return list;
	}

}
