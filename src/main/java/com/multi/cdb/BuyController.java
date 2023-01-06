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
//@RequestMapping("/sale")
public class BuyController {
	
	@Autowired
	BuyDAO dao;
	
	// 광역시도 코드로 파라미터 요청 후 검색
	@RequestMapping(value = "/h_sale", method= { RequestMethod.GET })
	@ResponseBody
	public Object sel_list(@RequestParam("by_brtc") String by_brtc) {
		List<BuyVO> list = dao.sel_list(by_brtc);
		return list;
	}

	// 세부 게시물 조회
	@RequestMapping(value = "/list_id", method = { RequestMethod.GET })
	public Object sel_list2(@RequestParam("by_pbid") String by_pbid, @RequestParam("by_brtc") String by_brtc, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("by_pbid", by_pbid);
		map.put("by_brtc", by_brtc);
		List<BuyVO> list = dao.list_id(map);
		model.addAttribute("list", list);
		return list;
	}
	
	// 전국 검색시 조회
	@RequestMapping(value = "/all", method = { RequestMethod.GET })
	@ResponseBody
	public Object all() {
		List<BuyVO> list = dao.all();
		return list;
	}
	
	
}
