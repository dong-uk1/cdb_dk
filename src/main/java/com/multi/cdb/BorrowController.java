package com.multi.cdb;

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
//@RequestMapping("/rent")
public class BorrowController {
	
	@Autowired
	BorrowDAO dao;
	
	// 쿼리 파라미터를 광역시로 요청함.
	@RequestMapping(value = "/rent_city", method = { RequestMethod.GET })
	@ResponseBody
	public Object sel_list(@RequestParam("br_brtc") String br_brtc) {
		List<BorrowVO> list = dao.city(br_brtc);
		return list;
	}

	// 쿼리 파라미터를 공고아이디와 광역시로 요청함.
	// 다중 파라미터라서 Map(HashMap)으로 받음. 
	@RequestMapping(value = "/rent_view", method= { RequestMethod.GET })
	public Object sel_list2(@RequestParam("br_pbid") String br_pbid, @RequestParam("br_brtc") String br_brtc, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("br_pbid", br_pbid);
		map.put("br_brtc", br_brtc);
		List<BorrowVO> list = dao.detail(map);
		String name = dao.show_pbname(br_pbid);
		model.addAttribute("list", list);
		model.addAttribute("name", name);
		return list;
	}
		
	// 전국 전체 데이터 조회
	@RequestMapping(value = "/rent_all", method = { RequestMethod.GET })
	@ResponseBody
	public Object all() {
		List<BorrowVO> list = dao.all();
		return list;
	}
	
}
