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

import lombok.extern.log4j.Log4j;

@Controller
//@RequestMapping("/sale")
@Log4j
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
	public Object sel_list2(@RequestParam("by_pbid") String by_pbid, Model model) {
		List<BuyVO> list = dao.list_id(by_pbid);
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
