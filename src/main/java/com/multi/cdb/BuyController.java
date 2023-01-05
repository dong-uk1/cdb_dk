package com.multi.cdb;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@RequestMapping(value = "/list_id", method = { RequestMethod.GET })
	public Object sel_list2(@RequestParam("by_pbid") String by_pbid, Model model) {
		List<BuyVO> list = dao.list_id(by_pbid);
		model.addAttribute("list", list);
		return list;
	}
	
	
	@RequestMapping(value = "/all", method = { RequestMethod.GET })
	@ResponseBody
	public Object all() {
		List<BuyVO> list = dao.all();
		return list;
	}
	
	
}
